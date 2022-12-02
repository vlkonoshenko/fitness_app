// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Train _$TrainFromJson(Map json) => Train(
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TrainToJson(Train instance) => <String, dynamic>{
      'name': instance.name,
      'date': instance.date.toIso8601String(),
    };
