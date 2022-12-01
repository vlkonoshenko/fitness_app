import 'package:freezed_annotation/freezed_annotation.dart';

part 'train.g.dart';

@JsonSerializable()
class Train {
  final String name;
  final DateTime date;

  Train({
    required this.name,
    required this.date,
  });

  factory Train.fromJson(Map<String, dynamic> json) => _$TrainFromJson(json);

  Map<String, dynamic> toJson() => _$TrainToJson(this);
}
