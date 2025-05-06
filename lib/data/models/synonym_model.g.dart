// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synonym_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SynonymModelAdapter extends TypeAdapter<SynonymModel> {
  @override
  final int typeId = 4;

  @override
  SynonymModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SynonymModel(
      hiveWord: fields[0] as String,
      hiveScore: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SynonymModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hiveWord)
      ..writeByte(1)
      ..write(obj.hiveScore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SynonymModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
