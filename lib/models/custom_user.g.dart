// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomUser _$CustomUserFromJson(Map<String, dynamic> json) => CustomUser(
      date: DateTime.parse(json['date'] as String),
      uid: json['uid'] as String,
      exercise: (json['exercise'] as List<dynamic>?)
              ?.map((e) => Train.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CustomUserToJson(CustomUser instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'uid': instance.uid,
      'exercise': instance.exercise.map((e) => e.toJson()).toList(),
    };
