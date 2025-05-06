// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordModelAdapter extends TypeAdapter<WordModel> {
  @override
  final int typeId = 3;

  @override
  WordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordModel(
      hiveWord: fields[0] as String,
      hivePhonetics: (fields[1] as List).cast<PhoneticModel>(),
      hiveMeanings: (fields[2] as List).cast<MeaningModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hiveWord)
      ..writeByte(1)
      ..write(obj.hivePhonetics)
      ..writeByte(2)
      ..write(obj.hiveMeanings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
