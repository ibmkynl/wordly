import 'definition_entity.dart';

class MeaningEntity {
  final String partOfSpeech;
  final List<DefinitionEntity> definitions;

  MeaningEntity({required this.partOfSpeech, required this.definitions});
}
