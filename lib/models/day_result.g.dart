// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayResult _$DayResultFromJson(Map json) => DayResult(
      date: DateTime.parse(json['date'] as String),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$DayResultToJson(DayResult instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
    };
