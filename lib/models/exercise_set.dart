import 'package:freezed_annotation/freezed_annotation.dart';

import 'hard_level.dart';

part 'exercise_set.freezed.dart';
part 'exercise_set.g.dart';

@freezed
class ExerciseSet with _$ExerciseSet {
  const factory ExerciseSet({int? count, int? weight, HardLevel? level}) =
      _ExerciseSet;

  factory ExerciseSet.fromJson(Map<String, Object?> json) =>
      _$ExerciseSetFromJson(json);
}
