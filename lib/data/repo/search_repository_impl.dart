import 'package:worldy/data/models/recent_search_model.dart';
import 'package:worldy/data/source/recent_search_local_data_source.dart';
import 'package:worldy/domain/entities/recent_search_entity.dart';
import 'package:worldy/domain/repositories/search_repository.dart';

class RecentSearchRepoImpl extends RecentSearchRepository {
  final RecentSearchLocalDataSource local;

  RecentSearchRepoImpl(this.local);

  @override
  Future<void> addSearch(RecentSearchEntity search) async {
    await local.cacheSearch(RecentSearchModel.fromEntity(search));
  }

  @override
  Future<List<RecentSearchEntity>> getRecentSearches() async {
    return await local.getCachedSearches();
  }
}
