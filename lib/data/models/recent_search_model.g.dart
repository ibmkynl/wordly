// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentSearchModelAdapter extends TypeAdapter<RecentSearchModel> {
  @override
  final int typeId = 5;

  @override
  RecentSearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentSearchModel(
      hiveWord: fields[0] as String,
      hiveSearchedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RecentSearchModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hiveWord)
      ..writeByte(1)
      ..write(obj.hiveSearchedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentSearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
