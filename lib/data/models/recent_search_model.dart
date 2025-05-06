import 'package:hive/hive.dart';

import '../../domain/entities/recent_search_entity.dart';

part 'recent_search_model.g.dart';

@HiveType(typeId: 5)
class RecentSearchModel extends RecentSearchEntity {
  @HiveField(0)
  final String hiveWord;

  @HiveField(1)
  final DateTime hiveSearchedAt;

  RecentSearchModel({required this.hiveWord, required this.hiveSearchedAt})
    : super(word: hiveWord, searchedAt: hiveSearchedAt);

  factory RecentSearchModel.fromEntity(RecentSearchEntity entity) =>
      RecentSearchModel(hiveWord: entity.word, hiveSearchedAt: entity.searchedAt);

  RecentSearchEntity toEntity() => RecentSearchEntity(word: hiveWord, searchedAt: hiveSearchedAt);

  factory RecentSearchModel.fromJson(Map<String, dynamic> json) =>
      RecentSearchModel(hiveWord: json['word'], hiveSearchedAt: DateTime.parse(json['searchedAt']));

  Map<String, dynamic> toJson() => {'word': hiveWord, 'searchedAt': hiveSearchedAt.toIso8601String()};
}
