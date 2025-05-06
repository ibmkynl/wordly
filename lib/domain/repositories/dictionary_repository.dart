import 'package:worldy/domain/entities/synonym_entity.dart';

import '../entities/word_entity.dart';

abstract class DictionaryRepository {
  Future<WordEntity> getWordDetails(String word);

  Future<List<SynonymEntity>> getWordSynonyms(String word);
}
