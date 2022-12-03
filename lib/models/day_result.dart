import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise.dart';

part 'day_result.g.dart';

@JsonSerializable(
  anyMap: true,
  explicitToJson: true,
)
class DayResult {
  final DateTime date;

  final List<Exercise> exercises;

  DayResult({required this.date, required this.exercises});

  factory DayResult.fromJson(Map<String, dynamic> json) =>
      _$DayResultFromJson(json);

  Map<String, dynamic> toJson() => _$DayResultToJson(this);
}
