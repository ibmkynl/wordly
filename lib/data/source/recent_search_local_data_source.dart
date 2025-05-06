import 'package:worldy/core/storage/hive_service.dart';
import 'package:worldy/data/models/recent_search_model.dart';

import '../../core/error/failure.dart';

abstract class RecentSearchLocalDataSource {
  Future<List<RecentSearchModel>> getCachedSearches();

  Future<void> cacheSearch(RecentSearchModel model);
}

class RecentSearchLocalDataSourceImpl extends RecentSearchLocalDataSource {
  final HiveService hiveService;

  static const String searchBoxName = 'searchBox';

  RecentSearchLocalDataSourceImpl(this.hiveService);

  @override
  Future<void> cacheSearch(RecentSearchModel model) async {
    try {
      await hiveService.put<RecentSearchModel>(searchBoxName, model.word, model);
    } catch (e) {
      throw CacheFailure('Failed to cache search: ${model.word}');
    }
  }

  @override
  Future<List<RecentSearchModel>> getCachedSearches() async {
    try {
      return await hiveService.getAll<RecentSearchModel>(searchBoxName);
    } catch (e) {
      throw CacheFailure('Failed to get cached searches');
    }
  }
}
