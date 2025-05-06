import 'package:hive/hive.dart';

import '../../domain/entities/definition_entity.dart';

part 'definition_model.g.dart';

@HiveType(typeId: 1)
class DefinitionModel extends DefinitionEntity {
  @HiveField(0)
  final String hiveDefinition;

  @HiveField(1)
  final String? hiveExample;

  DefinitionModel({required this.hiveDefinition, this.hiveExample})
    : super(definition: hiveDefinition, example: hiveExample);

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      DefinitionModel(hiveDefinition: json['definition'], hiveExample: json['example']);

  Map<String, dynamic> toJson() => {'definition': hiveDefinition, 'example': hiveExample};

  factory DefinitionModel.fromEntity(DefinitionEntity entity) =>
      DefinitionModel(hiveDefinition: entity.definition, hiveExample: entity.example);

  DefinitionEntity toEntity() => DefinitionEntity(definition: hiveDefinition, example: hiveExample);
}
