import 'package:worldy/domain/entities/phonetic_entity.dart';

import 'meaning_entity.dart';

class WordEntity {
  final String word;
  final List<PhoneticEntity> phonetics;
  final List<MeaningEntity> meanings;

  WordEntity({required this.word, required this.phonetics, required this.meanings});
}
