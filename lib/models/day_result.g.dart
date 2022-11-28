// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayResult _$DayResultFromJson(Map<String, dynamic> json) => DayResult(
      date: DateTime.parse(json['date'] as String),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayResultToJson(DayResult instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'exercises': instance.exercises,
    };
