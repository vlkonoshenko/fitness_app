import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_set.g.dart';

@JsonSerializable()
class ExerciseSet {
  final int? count;
  final int? weight;

  ExerciseSet({
    this.count,
    this.weight,
  });

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);
}
