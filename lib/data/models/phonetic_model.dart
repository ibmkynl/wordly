import 'package:hive/hive.dart';

import '../../domain/entities/phonetic_entity.dart';

part 'phonetic_model.g.dart';

@HiveType(typeId: 0)
class PhoneticModel extends PhoneticEntity {
  @HiveField(0)
  final String hiveText;

  @HiveField(1)
  final String hiveAudio;

  PhoneticModel({required this.hiveText, required this.hiveAudio}) : super(text: hiveText, audio: hiveAudio);

  factory PhoneticModel.fromJson(Map<String, dynamic> json) =>
      PhoneticModel(hiveText: json['text'] ?? '', hiveAudio: json['audio'] ?? '');

  Map<String, dynamic> toJson() => {'text': hiveText, 'audio': hiveAudio};

  factory PhoneticModel.fromEntity(PhoneticEntity entity) =>
      PhoneticModel(hiveText: entity.text, hiveAudio: entity.audio);

  PhoneticEntity toEntity() => PhoneticEntity(text: hiveText, audio: hiveAudio);
}
