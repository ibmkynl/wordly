import 'package:hive/hive.dart';

import '../../domain/entities/meaning_entity.dart';
import 'definition_model.dart';

part 'meaning_model.g.dart';

@HiveType(typeId: 2)
class MeaningModel extends MeaningEntity {
  @HiveField(0)
  final String hivePartOfSpeech;

  @HiveField(1)
  final List<DefinitionModel> hiveDefinitions;

  MeaningModel({required this.hivePartOfSpeech, required this.hiveDefinitions})
    : super(partOfSpeech: hivePartOfSpeech, definitions: hiveDefinitions);

  factory MeaningModel.fromJson(Map<String, dynamic> json) => MeaningModel(
    hivePartOfSpeech: json['partOfSpeech'],
    hiveDefinitions: (json['definitions'] as List).map((e) => DefinitionModel.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'partOfSpeech': hivePartOfSpeech,
    'definitions': hiveDefinitions.map((e) => e.toJson()).toList(),
  };

  factory MeaningModel.fromEntity(MeaningEntity entity) => MeaningModel(
    hivePartOfSpeech: entity.partOfSpeech,
    hiveDefinitions: entity.definitions.map(DefinitionModel.fromEntity).toList(),
  );

  MeaningEntity toEntity() =>
      MeaningEntity(partOfSpeech: hivePartOfSpeech, definitions: hiveDefinitions.map((e) => e.toEntity()).toList());
}
