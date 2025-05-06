import 'package:flutter/cupertino.dart';
import 'package:worldy/core/error/failure.dart';
import 'package:worldy/domain/entities/synonym_entity.dart';
import 'package:worldy/domain/entities/word_entity.dart';
import 'package:worldy/domain/usecases/get_word_detail_usecase.dart';
import 'package:worldy/domain/usecases/get_word_synonyms_usecase.dart';
import 'package:worldy/presentation/providers/recent_search_provider.dart';

class WordDetailProvider extends ChangeNotifier {
  final GetWordDetailsUseCase getWordDetailsUseCase;
  final GetWordSynonymsUseCase getTopSynonymsUseCase;
  final RecentSearchProvider recentSearchProvider;

  WordDetailProvider({
    required this.getWordDetailsUseCase,
    required this.getTopSynonymsUseCase,
    required this.recentSearchProvider,
  });

  bool isLoading = false;
  String? errorMessage;

  WordEntity? searchedWord;
  List<SynonymEntity> synonyms = [];
  List<String> selectedFilters = [];

  void selectFilter(String filter) {
    selectedFilters.contains(filter) ? selectedFilters.remove(filter) : selectedFilters.add(filter);
    notifyListeners();
  }

  void clearFilters() {
    selectedFilters.clear();
    notifyListeners();
  }

  Future<void> search(String word) async {
    _resetState();
    notifyListeners();

    try {
      searchedWord = await getWordDetailsUseCase.call(word);
      synonyms = (await getTopSynonymsUseCase.call(word)).take(5).toList();

      if (searchedWord != null) {
        await recentSearchProvider.addSearch(searchedWord!.word);
      }
    } on Failure catch (failure) {
      errorMessage = failure.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _resetState() {
    synonyms = [];
    selectedFilters.clear();
    isLoading = true;
    errorMessage = null;
    searchedWord = null;
  }
}
