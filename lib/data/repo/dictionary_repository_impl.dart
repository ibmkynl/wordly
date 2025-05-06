import 'package:worldy/data/models/word_model.dart';
import 'package:worldy/domain/entities/synonym_entity.dart';

import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/dictionary_repository.dart';
import '../models/synonym_model.dart';
import '../source/word_local_data_source.dart';
import '../source/word_remote_data_source.dart';

class DictionaryRepoImpl implements DictionaryRepository {
  final WordRemoteDataSource remote;
  final WordLocalDataSource local;

  DictionaryRepoImpl({required this.remote, required this.local});

  @override
  Future<WordEntity> getWordDetails(String word) async {
    final cached = await local.getCachedWord(word);
    if (cached != null) return cached.toEntity();

    WordModel remoteData = await remote.fetchWordDetails(word);
    await local.cacheWord(remoteData);
    return remoteData.toEntity();
  }

  @override
  Future<List<SynonymEntity>> getWordSynonyms(String word) async {
    final cached = await local.getCachedSynonyms(word);
    if (cached != null && cached.isNotEmpty) return _sortTop5(cached);

    final remoteData = await remote.fetchSynonyms(word);
    await local.cacheSynonyms(word, remoteData);
    return _sortTop5(remoteData);
  }

  List<SynonymEntity> _sortTop5(List<SynonymModel> list) {
    list.sort((a, b) => b.score.compareTo(a.score));
    return list.map((e) => e.toEntity()).toList();
  }
}
