import 'package:hive/hive.dart';

import '../../domain/entities/favorite_word_entity.dart';

part 'favorite_word_model.g.dart';

@HiveType(typeId: 6)
class FavoriteWordModel extends FavoriteWordEntity {
  @HiveField(0)
  final String hiveWord;

  @HiveField(1)
  final DateTime hiveAddedAt;

  FavoriteWordModel({required this.hiveWord, required this.hiveAddedAt}) : super(word: hiveWord, addedAt: hiveAddedAt);

  factory FavoriteWordModel.fromEntity(FavoriteWordEntity entity) =>
      FavoriteWordModel(hiveWord: entity.word, hiveAddedAt: entity.addedAt);

  FavoriteWordEntity toEntity() => FavoriteWordEntity(word: hiveWord, addedAt: hiveAddedAt);

  factory FavoriteWordModel.fromJson(Map<String, dynamic> json) =>
      FavoriteWordModel(hiveWord: json['word'], hiveAddedAt: DateTime.parse(json['addedAt']));

  Map<String, dynamic> toJson() => {'word': hiveWord, 'addedAt': hiveAddedAt.toIso8601String()};
}
