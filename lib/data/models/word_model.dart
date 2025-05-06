import 'package:hive/hive.dart';

import '../../domain/entities/word_entity.dart';
import 'meaning_model.dart';
import 'phonetic_model.dart';

part 'word_model.g.dart';

@HiveType(typeId: 3)
class WordModel extends WordEntity {
  @HiveField(0)
  final String hiveWord;

  @HiveField(1)
  final List<PhoneticModel> hivePhonetics;

  @HiveField(2)
  final List<MeaningModel> hiveMeanings;

  WordModel({required this.hiveWord, required this.hivePhonetics, required this.hiveMeanings})
    : super(word: hiveWord, phonetics: hivePhonetics, meanings: hiveMeanings);

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
    hiveWord: json['word'],
    hivePhonetics: (json['phonetics'] as List).map((e) => PhoneticModel.fromJson(e)).toList(),
    hiveMeanings: (json['meanings'] as List).map((e) => MeaningModel.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'word': hiveWord,
    'phonetics': hivePhonetics.map((e) => e.toJson()).toList(),
    'meanings': hiveMeanings.map((e) => e.toJson()).toList(),
  };

  factory WordModel.fromEntity(WordEntity entity) => WordModel(
    hiveWord: entity.word,
    hivePhonetics: entity.phonetics.map(PhoneticModel.fromEntity).toList(),
    hiveMeanings: entity.meanings.map(MeaningModel.fromEntity).toList(),
  );

  WordEntity toEntity() => WordEntity(
    word: hiveWord,
    phonetics: hivePhonetics.map((e) => e.toEntity()).toList(),
    meanings: hiveMeanings.map((e) => e.toEntity()).toList(),
  );
}
