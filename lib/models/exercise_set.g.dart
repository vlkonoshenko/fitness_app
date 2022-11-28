// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExerciseSet _$$_ExerciseSetFromJson(Map<String, dynamic> json) =>
    _$_ExerciseSet(
      count: json['count'] as int?,
      weight: json['weight'] as int?,
      level: $enumDecodeNullable(_$HardLevelEnumMap, json['level']),
    );

Map<String, dynamic> _$$_ExerciseSetToJson(_$_ExerciseSet instance) =>
    <String, dynamic>{
      'count': instance.count,
      'weight': instance.weight,
      'level': _$HardLevelEnumMap[instance.level],
    };

const _$HardLevelEnumMap = {
  HardLevel.easy: 'easy',
  HardLevel.medium: 'medium',
  HardLevel.hard: 'hard',
};
