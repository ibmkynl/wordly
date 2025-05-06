import '../entities/word_entity.dart';
import '../repositories/dictionary_repository.dart';

class GetWordDetailsUseCase {
  final DictionaryRepository repository;

  GetWordDetailsUseCase(this.repository);

  Future<WordEntity> call(String word) {
    return repository.getWordDetails(word);
  }
}
