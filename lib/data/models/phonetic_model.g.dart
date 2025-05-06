// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phonetic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneticModelAdapter extends TypeAdapter<PhoneticModel> {
  @override
  final int typeId = 0;

  @override
  PhoneticModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhoneticModel(
      hiveText: fields[0] as String,
      hiveAudio: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhoneticModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hiveText)
      ..writeByte(1)
      ..write(obj.hiveAudio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneticModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
