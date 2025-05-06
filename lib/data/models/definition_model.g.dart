// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DefinitionModelAdapter extends TypeAdapter<DefinitionModel> {
  @override
  final int typeId = 1;

  @override
  DefinitionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DefinitionModel(
      hiveDefinition: fields[0] as String,
      hiveExample: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DefinitionModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hiveDefinition)
      ..writeByte(1)
      ..write(obj.hiveExample);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefinitionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
