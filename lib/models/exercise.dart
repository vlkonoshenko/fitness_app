import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise_set.dart';

part 'exercise.g.dart';

@JsonSerializable(
  anyMap: true,
  explicitToJson: true,
)
class Exercise {
  final String name;

  final List<ExerciseSet> sets;

  Exercise({required this.name, required this.sets});

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
