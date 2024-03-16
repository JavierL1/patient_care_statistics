// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_professional_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthProfessionalEntry _$HealthProfessionalEntryFromJson(
    Map<String, dynamic> json) {
  return _HealthProfessionalEntry.fromJson(json);
}

/// @nodoc
mixin _$HealthProfessionalEntry {
  DateTime get insertedAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profession => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthProfessionalEntryCopyWith<HealthProfessionalEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthProfessionalEntryCopyWith<$Res> {
  factory $HealthProfessionalEntryCopyWith(HealthProfessionalEntry value,
          $Res Function(HealthProfessionalEntry) then) =
      _$HealthProfessionalEntryCopyWithImpl<$Res, HealthProfessionalEntry>;
  @useResult
  $Res call({DateTime insertedAt, String name, String profession});
}

/// @nodoc
class _$HealthProfessionalEntryCopyWithImpl<$Res,
        $Val extends HealthProfessionalEntry>
    implements $HealthProfessionalEntryCopyWith<$Res> {
  _$HealthProfessionalEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insertedAt = null,
    Object? name = null,
    Object? profession = null,
  }) {
    return _then(_value.copyWith(
      insertedAt: null == insertedAt
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profession: null == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthProfessionalEntryImplCopyWith<$Res>
    implements $HealthProfessionalEntryCopyWith<$Res> {
  factory _$$HealthProfessionalEntryImplCopyWith(
          _$HealthProfessionalEntryImpl value,
          $Res Function(_$HealthProfessionalEntryImpl) then) =
      __$$HealthProfessionalEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime insertedAt, String name, String profession});
}

/// @nodoc
class __$$HealthProfessionalEntryImplCopyWithImpl<$Res>
    extends _$HealthProfessionalEntryCopyWithImpl<$Res,
        _$HealthProfessionalEntryImpl>
    implements _$$HealthProfessionalEntryImplCopyWith<$Res> {
  __$$HealthProfessionalEntryImplCopyWithImpl(
      _$HealthProfessionalEntryImpl _value,
      $Res Function(_$HealthProfessionalEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insertedAt = null,
    Object? name = null,
    Object? profession = null,
  }) {
    return _then(_$HealthProfessionalEntryImpl(
      insertedAt: null == insertedAt
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profession: null == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthProfessionalEntryImpl implements _HealthProfessionalEntry {
  const _$HealthProfessionalEntryImpl(
      {required this.insertedAt, required this.name, required this.profession});

  factory _$HealthProfessionalEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthProfessionalEntryImplFromJson(json);

  @override
  final DateTime insertedAt;
  @override
  final String name;
  @override
  final String profession;

  @override
  String toString() {
    return 'HealthProfessionalEntry(insertedAt: $insertedAt, name: $name, profession: $profession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthProfessionalEntryImpl &&
            (identical(other.insertedAt, insertedAt) ||
                other.insertedAt == insertedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profession, profession) ||
                other.profession == profession));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, insertedAt, name, profession);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthProfessionalEntryImplCopyWith<_$HealthProfessionalEntryImpl>
      get copyWith => __$$HealthProfessionalEntryImplCopyWithImpl<
          _$HealthProfessionalEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthProfessionalEntryImplToJson(
      this,
    );
  }
}

abstract class _HealthProfessionalEntry implements HealthProfessionalEntry {
  const factory _HealthProfessionalEntry(
      {required final DateTime insertedAt,
      required final String name,
      required final String profession}) = _$HealthProfessionalEntryImpl;

  factory _HealthProfessionalEntry.fromJson(Map<String, dynamic> json) =
      _$HealthProfessionalEntryImpl.fromJson;

  @override
  DateTime get insertedAt;
  @override
  String get name;
  @override
  String get profession;
  @override
  @JsonKey(ignore: true)
  _$$HealthProfessionalEntryImplCopyWith<_$HealthProfessionalEntryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
