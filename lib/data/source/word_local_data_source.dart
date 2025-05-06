import '../../core/error/failure.dart';
import '../../core/storage/hive_service.dart';
import '../models/synonym_model.dart';
import '../models/word_model.dart';

abstract class WordLocalDataSource {
  Future<WordModel?> getCachedWord(String word);

  Future<void> cacheWord(WordModel model);

  Future<List<SynonymModel>?> getCachedSynonyms(String word);

  Future<void> cacheSynonyms(String word, List<SynonymModel> list);
}

class WordLocalDataSourceImpl implements WordLocalDataSource {
  final HiveService hiveService;

  static const String wordBoxName = 'wordBox';
  static const String synonymBoxName = 'synonymBox';

  WordLocalDataSourceImpl(this.hiveService);

  @override
  Future<WordModel?> getCachedWord(String word) async {
    try {
      return await hiveService.get<WordModel>(wordBoxName, word);
    } catch (e) {
      throw CacheFailure('Failed to get cached word: $word');
    }
  }

  @override
  Future<void> cacheWord(WordModel model) async {
    try {
      await hiveService.put<WordModel>(wordBoxName, model.word, model);
    } catch (e) {
      throw CacheFailure('Failed to cache word: ${model.word}');
    }
  }

  @override
  Future<List<SynonymModel>?> getCachedSynonyms(String word) async {
    try {
      final raw = await hiveService.get(synonymBoxName, word);
      if (raw is List) {
        return raw.cast<SynonymModel>();
      }
      return null;
    } catch (e) {
      throw CacheFailure('Failed to get cached synonyms for: $word');
    }
  }

  @override
  Future<void> cacheSynonyms(String word, List<SynonymModel> list) async {
    try {
      await hiveService.put(synonymBoxName, word, list.map((e) => e).toList());
    } catch (e) {
      throw CacheFailure('Failed to cache synonyms for: $word');
    }
  }
}
