import 'package:freezed_annotation/freezed_annotation.dart';

import 'train.dart';

part 'custom_user.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomUser {
  final DateTime date;
  final String uid;
  final List<Train> exercise;

  CustomUser({
    required this.date,
    required this.uid,
    this.exercise = const [],
  });

  factory CustomUser.fromJson(Map<String, dynamic> json) => _$CustomUserFromJson(json);

  Map<String, dynamic> toJson() => _$CustomUserToJson(this);
}
