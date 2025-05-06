import '../entities/favorite_word_entity.dart';

abstract class FavoritesRepository {
  Future<void> addFavorite(FavoriteWordEntity favorite);
  Future<void> removeFavorite(String word);
  Future<List<FavoriteWordEntity>> getFavorites();
}
