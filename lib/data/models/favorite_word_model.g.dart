// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_word_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteWordModelAdapter extends TypeAdapter<FavoriteWordModel> {
  @override
  final int typeId = 6;

  @override
  FavoriteWordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteWordModel(
      hiveWord: fields[0] as String,
      hiveAddedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteWordModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hiveWord)
      ..writeByte(1)
      ..write(obj.hiveAddedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteWordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
