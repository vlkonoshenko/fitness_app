// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exercise_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExerciseSet _$ExerciseSetFromJson(Map<String, dynamic> json) {
  return _ExerciseSet.fromJson(json);
}

/// @nodoc
mixin _$ExerciseSet {
  int? get count => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  HardLevel? get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseSetCopyWith<ExerciseSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseSetCopyWith<$Res> {
  factory $ExerciseSetCopyWith(
          ExerciseSet value, $Res Function(ExerciseSet) then) =
      _$ExerciseSetCopyWithImpl<$Res, ExerciseSet>;
  @useResult
  $Res call({int? count, int? weight, HardLevel? level});
}

/// @nodoc
class _$ExerciseSetCopyWithImpl<$Res, $Val extends ExerciseSet>
    implements $ExerciseSetCopyWith<$Res> {
  _$ExerciseSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? weight = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as HardLevel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExerciseSetCopyWith<$Res>
    implements $ExerciseSetCopyWith<$Res> {
  factory _$$_ExerciseSetCopyWith(
          _$_ExerciseSet value, $Res Function(_$_ExerciseSet) then) =
      __$$_ExerciseSetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, int? weight, HardLevel? level});
}

/// @nodoc
class __$$_ExerciseSetCopyWithImpl<$Res>
    extends _$ExerciseSetCopyWithImpl<$Res, _$_ExerciseSet>
    implements _$$_ExerciseSetCopyWith<$Res> {
  __$$_ExerciseSetCopyWithImpl(
      _$_ExerciseSet _value, $Res Function(_$_ExerciseSet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? weight = freezed,
    Object? level = freezed,
  }) {
    return _then(_$_ExerciseSet(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as HardLevel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExerciseSet implements _ExerciseSet {
  const _$_ExerciseSet({this.count, this.weight, this.level});

  factory _$_ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseSetFromJson(json);

  @override
  final int? count;
  @override
  final int? weight;
  @override
  final HardLevel? level;

  @override
  String toString() {
    return 'ExerciseSet(count: $count, weight: $weight, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExerciseSet &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, weight, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExerciseSetCopyWith<_$_ExerciseSet> get copyWith =>
      __$$_ExerciseSetCopyWithImpl<_$_ExerciseSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExerciseSetToJson(
      this,
    );
  }
}

abstract class _ExerciseSet implements ExerciseSet {
  const factory _ExerciseSet(
      {final int? count,
      final int? weight,
      final HardLevel? level}) = _$_ExerciseSet;

  factory _ExerciseSet.fromJson(Map<String, dynamic> json) =
      _$_ExerciseSet.fromJson;

  @override
  int? get count;
  @override
  int? get weight;
  @override
  HardLevel? get level;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseSetCopyWith<_$_ExerciseSet> get copyWith =>
      throw _privateConstructorUsedError;
}
