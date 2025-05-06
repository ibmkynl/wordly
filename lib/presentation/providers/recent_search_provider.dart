import 'package:flutter/cupertino.dart';
import 'package:worldy/domain/usecases/get_recent_searches_usecase.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/recent_search_entity.dart';

class RecentSearchProvider extends ChangeNotifier {
  final RecentSearchUseCase recentSearchUseCase;

  RecentSearchProvider({required this.recentSearchUseCase}) {
    init();
  }

  bool isLoading = false;
  String? errorMessage;
  List<RecentSearchEntity> recentSearchList = [];

  void init() {
    Future.microtask(() => getRecentSearches());
  }

  Future<void> addSearch(String word) async {
    try {
      isLoading = true;
      notifyListeners();

      await recentSearchUseCase.add(word);
      await getRecentSearches();
      errorMessage = null;
    } on Failure catch (failure) {
      errorMessage = failure.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getRecentSearches() async {
    try {
      isLoading = true;
      notifyListeners();

      recentSearchList = await recentSearchUseCase.getAll();

      recentSearchList.sort((f, s) => s.searchedAt.compareTo(f.searchedAt));

      recentSearchList = recentSearchList.take(10).toList();

      errorMessage = null;
    } on Failure catch (failure) {
      errorMessage = failure.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
