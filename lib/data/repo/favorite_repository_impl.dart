import 'package:worldy/data/models/favorite_word_model.dart';
import 'package:worldy/domain/entities/favorite_word_entity.dart';
import 'package:worldy/domain/repositories/favorites_repository.dart';

import '../source/favorite_local_data_source.dart';

class FavoriteRepoImpl implements FavoritesRepository {
  final FavoriteLocalDataSource local;

  FavoriteRepoImpl(this.local);

  @override
  Future<void> addFavorite(FavoriteWordEntity favorite) async {
    await local.addFavorites(FavoriteWordModel.fromEntity(favorite));
  }

  @override
  Future<List<FavoriteWordEntity>> getFavorites() async {
    return await local.getFavoritesList();
  }

  @override
  Future<void> removeFavorite(String word) async {
    await local.removeFavorites(word);
  }
}
