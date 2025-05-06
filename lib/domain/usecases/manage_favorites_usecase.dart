import '../entities/favorite_word_entity.dart';
import '../repositories/favorites_repository.dart';

class FavoritesUseCase {
  final FavoritesRepository repository;

  FavoritesUseCase(this.repository);

  Future<void> add(String word) {
    final entity = FavoriteWordEntity(word: word, addedAt: DateTime.now());
    return repository.addFavorite(entity);
  }

  Future<void> remove(String word) {
    return repository.removeFavorite(word);
  }

  Future<List<FavoriteWordEntity>> getAll() {
    return repository.getFavorites();
  }
}
