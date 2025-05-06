import 'package:flutter/widgets.dart';
import 'package:worldy/domain/entities/favorite_word_entity.dart';
import 'package:worldy/domain/usecases/manage_favorites_usecase.dart';

import '../../core/error/failure.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesUseCase favoritesUseCase;

  FavoritesProvider({required this.favoritesUseCase}) {
    init();
  }

  List<FavoriteWordEntity> favorites = [];

  bool isLoading = false;
  String? errorMessage;

  void init() {
    Future.microtask(() => getFavorites());
  }

  bool isFavorite(String word) => favorites.any((e) => e.word == word);

  Future<void> getFavorites() async {
    try {
      isLoading = true;
      notifyListeners();

      favorites = await favoritesUseCase.getAll();
      errorMessage = null;
    } on Failure catch (failure) {
      errorMessage = failure.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> handleFavoriteAction(String word) async {
    if (isFavorite(word)) {
      await favoritesUseCase.remove(word);
    } else {
      await favoritesUseCase.add(word);
    }
    getFavorites();
  }
}
