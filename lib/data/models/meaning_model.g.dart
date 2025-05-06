// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeaningModelAdapter extends TypeAdapter<MeaningModel> {
  @override
  final int typeId = 2;

  @override
  MeaningModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeaningModel(
      hivePartOfSpeech: fields[0] as String,
      hiveDefinitions: (fields[1] as List).cast<DefinitionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MeaningModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hivePartOfSpeech)
      ..writeByte(1)
      ..write(obj.hiveDefinitions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeaningModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
