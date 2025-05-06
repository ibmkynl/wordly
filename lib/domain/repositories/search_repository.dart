import '../entities/recent_search_entity.dart';

abstract class RecentSearchRepository {
  Future<void> addSearch(RecentSearchEntity entity);
  Future<List<RecentSearchEntity>> getRecentSearches();
}
