import 'package:hive/hive.dart';

import '../../domain/entities/synonym_entity.dart';

part 'synonym_model.g.dart';

@HiveType(typeId: 4)
class SynonymModel extends SynonymEntity {
  @HiveField(0)
  final String hiveWord;

  @HiveField(1)
  final int hiveScore;

  SynonymModel({required this.hiveWord, required this.hiveScore}) : super(word: hiveWord, score: hiveScore);

  factory SynonymModel.fromJson(Map<String, dynamic> json) =>
      SynonymModel(hiveWord: json['word'], hiveScore: json['score'] ?? 0);

  Map<String, dynamic> toJson() => {'word': hiveWord, 'score': hiveScore};

  factory SynonymModel.fromEntity(SynonymEntity entity) => SynonymModel(hiveWord: entity.word, hiveScore: entity.score);

  SynonymEntity toEntity() => SynonymEntity(word: hiveWord, score: hiveScore);
}
