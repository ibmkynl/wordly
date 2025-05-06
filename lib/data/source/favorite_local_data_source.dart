import 'package:worldy/data/models/favorite_word_model.dart';

import '../../core/error/failure.dart';
import '../../core/storage/hive_service.dart';

abstract class FavoriteLocalDataSource {
  Future<List<FavoriteWordModel>> getFavoritesList();

  Future<void> addFavorites(FavoriteWordModel model);

  Future<void> removeFavorites(String word);
}

class FavoriteLocalDataSourceImpl extends FavoriteLocalDataSource {
  final HiveService hiveService;

  static const String favoritesBoxName = 'favoritesBoxName';

  FavoriteLocalDataSourceImpl(this.hiveService);

  @override
  Future<void> addFavorites(FavoriteWordModel model) async {
    try {
      await hiveService.put<FavoriteWordModel>(favoritesBoxName, model.word, model);
    } catch (e) {
      throw CacheFailure('Failed to add favorite word: ${model.word}');
    }
  }

  @override
  Future<List<FavoriteWordModel>> getFavoritesList() async {
    try {
      return await hiveService.getAll<FavoriteWordModel>(favoritesBoxName);
    } catch (e) {
      throw CacheFailure('Failed to get favorites');
    }
  }

  @override
  Future<void> removeFavorites(String word) async {
    try {
      await hiveService.delete(favoritesBoxName, word);
    } catch (e) {
      throw CacheFailure('Failed to delete word from favorites: $word');
    }
  }
}
