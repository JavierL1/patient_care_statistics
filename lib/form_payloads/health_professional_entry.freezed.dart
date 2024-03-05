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

/// @nodoc
mixin _$HealthProfessionalEntry {
  DateTime get insertedAt => throw _privateConstructorUsedError;
  HealthProfessional get healthProfessional =>
      throw _privateConstructorUsedError;

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
  $Res call({DateTime insertedAt, HealthProfessional healthProfessional});

  $HealthProfessionalCopyWith<$Res> get healthProfessional;
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
    Object? healthProfessional = null,
  }) {
    return _then(_value.copyWith(
      insertedAt: null == insertedAt
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      healthProfessional: null == healthProfessional
          ? _value.healthProfessional
          : healthProfessional // ignore: cast_nullable_to_non_nullable
              as HealthProfessional,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HealthProfessionalCopyWith<$Res> get healthProfessional {
    return $HealthProfessionalCopyWith<$Res>(_value.healthProfessional,
        (value) {
      return _then(_value.copyWith(healthProfessional: value) as $Val);
    });
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
  $Res call({DateTime insertedAt, HealthProfessional healthProfessional});

  @override
  $HealthProfessionalCopyWith<$Res> get healthProfessional;
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
    Object? healthProfessional = null,
  }) {
    return _then(_$HealthProfessionalEntryImpl(
      insertedAt: null == insertedAt
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      healthProfessional: null == healthProfessional
          ? _value.healthProfessional
          : healthProfessional // ignore: cast_nullable_to_non_nullable
              as HealthProfessional,
    ));
  }
}

/// @nodoc

class _$HealthProfessionalEntryImpl implements _HealthProfessionalEntry {
  const _$HealthProfessionalEntryImpl(
      {required this.insertedAt, required this.healthProfessional});

  @override
  final DateTime insertedAt;
  @override
  final HealthProfessional healthProfessional;

  @override
  String toString() {
    return 'HealthProfessionalEntry(insertedAt: $insertedAt, healthProfessional: $healthProfessional)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthProfessionalEntryImpl &&
            (identical(other.insertedAt, insertedAt) ||
                other.insertedAt == insertedAt) &&
            (identical(other.healthProfessional, healthProfessional) ||
                other.healthProfessional == healthProfessional));
  }

  @override
  int get hashCode => Object.hash(runtimeType, insertedAt, healthProfessional);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthProfessionalEntryImplCopyWith<_$HealthProfessionalEntryImpl>
      get copyWith => __$$HealthProfessionalEntryImplCopyWithImpl<
          _$HealthProfessionalEntryImpl>(this, _$identity);
}

abstract class _HealthProfessionalEntry implements HealthProfessionalEntry {
  const factory _HealthProfessionalEntry(
          {required final DateTime insertedAt,
          required final HealthProfessional healthProfessional}) =
      _$HealthProfessionalEntryImpl;

  @override
  DateTime get insertedAt;
  @override
  HealthProfessional get healthProfessional;
  @override
  @JsonKey(ignore: true)
  _$$HealthProfessionalEntryImplCopyWith<_$HealthProfessionalEntryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
