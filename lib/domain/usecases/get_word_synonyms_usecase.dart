import 'package:worldy/domain/entities/synonym_entity.dart';
import 'package:worldy/domain/repositories/dictionary_repository.dart';

class GetWordSynonymsUseCase {
  final DictionaryRepository repository;

  GetWordSynonymsUseCase(this.repository);

  Future<List<SynonymEntity>> call(String word) {
    return repository.getWordSynonyms(word);
  }
}
