import '../entities/recent_search_entity.dart';
import '../repositories/search_repository.dart';

class RecentSearchUseCase {
  final RecentSearchRepository repository;

  RecentSearchUseCase(this.repository);

  Future<List<RecentSearchEntity>> getAll() async {
    return await repository.getRecentSearches();
  }

  Future<void> add(String word) async {
    final entity = RecentSearchEntity(word: word, searchedAt: DateTime.now());
    return await repository.addSearch(entity);
  }
}
