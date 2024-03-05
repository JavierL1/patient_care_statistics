// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_born_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewBornEntry _$NewBornEntryFromJson(Map<String, dynamic> json) {
  return _NewBornEntry.fromJson(json);
}

/// @nodoc
mixin _$NewBornEntry {
  DateTime get insertedAt => throw _privateConstructorUsedError;
  String get sectorCode => throw _privateConstructorUsedError;
  String get bedCode => throw _privateConstructorUsedError;
  DateTime get entryDateTime => throw _privateConstructorUsedError;
  String get newBornName => throw _privateConstructorUsedError;
  DateTime get birthDateTime => throw _privateConstructorUsedError;
  String get healthInsurance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewBornEntryCopyWith<NewBornEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewBornEntryCopyWith<$Res> {
  factory $NewBornEntryCopyWith(
          NewBornEntry value, $Res Function(NewBornEntry) then) =
      _$NewBornEntryCopyWithImpl<$Res, NewBornEntry>;
  @useResult
  $Res call(
      {DateTime insertedAt,
      String sectorCode,
      String bedCode,
      DateTime entryDateTime,
      String newBornName,
      DateTime birthDateTime,
      String healthInsurance});
}

/// @nodoc
class _$NewBornEntryCopyWithImpl<$Res, $Val extends NewBornEntry>
    implements $NewBornEntryCopyWith<$Res> {
  _$NewBornEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insertedAt = null,
    Object? sectorCode = null,
    Object? bedCode = null,
    Object? entryDateTime = null,
    Object? newBornName = null,
    Object? birthDateTime = null,
    Object? healthInsurance = null,
  }) {
    return _then(_value.copyWith(
      insertedAt: null == insertedAt
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sectorCode: null == sectorCode
          ? _value.sectorCode
          : sectorCode // ignore: cast_nullable_to_non_nullable
              as String,
      bedCode: null == bedCode
          ? _value.bedCode
          : bedCode // ignore: cast_nullable_to_non_nullable
              as String,
      entryDateTime: null == entryDateTime
          ? _value.entryDateTime
          : entryDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newBornName: null == newBornName
          ? _value.newBornName
          : newBornName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDateTime: null == birthDateTime
          ? _value.birthDateTime
          : birthDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      healthInsurance: null == healthInsurance
          ? _value.healthInsurance
          : healthInsurance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewBornEntryImplCopyWith<$Res>
    implements $NewBornEntryCopyWith<$Res> {
  factory _$$NewBornEntryImplCopyWith(
          _$NewBornEntryImpl value, $Res Function(_$NewBornEntryImpl) then) =
      __$$NewBornEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime insertedAt,
      String sectorCode,
      String bedCode,
      DateTime entryDateTime,
      String newBornName,
      DateTime birthDateTime,
      String healthInsurance});
}

/// @nodoc
class __$$NewBornEntryImplCopyWithImpl<$Res>
    extends _$NewBornEntryCopyWithImpl<$Res, _$NewBornEntryImpl>
    implements _$$NewBornEntryImplCopyWith<$Res> {
  __$$NewBornEntryImplCopyWithImpl(
      _$NewBornEntryImpl _value, $Res Function(_$NewBornEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insertedAt = null,
    Object? sectorCode = null,
    Object? bedCode = null,
    Object? entryDateTime = null,
    Object? newBornName = null,
    Object? birthDateTime = null,
    Object? healthInsurance = null,
  }) {
    return _then(_$NewBornEntryImpl(
      insertedAt: null == insertedAt
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sectorCode: null == sectorCode
          ? _value.sectorCode
          : sectorCode // ignore: cast_nullable_to_non_nullable
              as String,
      bedCode: null == bedCode
          ? _value.bedCode
          : bedCode // ignore: cast_nullable_to_non_nullable
              as String,
      entryDateTime: null == entryDateTime
          ? _value.entryDateTime
          : entryDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newBornName: null == newBornName
          ? _value.newBornName
          : newBornName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDateTime: null == birthDateTime
          ? _value.birthDateTime
          : birthDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      healthInsurance: null == healthInsurance
          ? _value.healthInsurance
          : healthInsurance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewBornEntryImpl implements _NewBornEntry {
  const _$NewBornEntryImpl(
      {required this.insertedAt,
      required this.sectorCode,
      required this.bedCode,
      required this.entryDateTime,
      required this.newBornName,
      required this.birthDateTime,
      required this.healthInsurance});

  factory _$NewBornEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewBornEntryImplFromJson(json);

  @override
  final DateTime insertedAt;
  @override
  final String sectorCode;
  @override
  final String bedCode;
  @override
  final DateTime entryDateTime;
  @override
  final String newBornName;
  @override
  final DateTime birthDateTime;
  @override
  final String healthInsurance;

  @override
  String toString() {
    return 'NewBornEntry(insertedAt: $insertedAt, sectorCode: $sectorCode, bedCode: $bedCode, entryDateTime: $entryDateTime, newBornName: $newBornName, birthDateTime: $birthDateTime, healthInsurance: $healthInsurance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewBornEntryImpl &&
            (identical(other.insertedAt, insertedAt) ||
                other.insertedAt == insertedAt) &&
            (identical(other.sectorCode, sectorCode) ||
                other.sectorCode == sectorCode) &&
            (identical(other.bedCode, bedCode) || other.bedCode == bedCode) &&
            (identical(other.entryDateTime, entryDateTime) ||
                other.entryDateTime == entryDateTime) &&
            (identical(other.newBornName, newBornName) ||
                other.newBornName == newBornName) &&
            (identical(other.birthDateTime, birthDateTime) ||
                other.birthDateTime == birthDateTime) &&
            (identical(other.healthInsurance, healthInsurance) ||
                other.healthInsurance == healthInsurance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, insertedAt, sectorCode, bedCode,
      entryDateTime, newBornName, birthDateTime, healthInsurance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewBornEntryImplCopyWith<_$NewBornEntryImpl> get copyWith =>
      __$$NewBornEntryImplCopyWithImpl<_$NewBornEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewBornEntryImplToJson(
      this,
    );
  }
}

abstract class _NewBornEntry implements NewBornEntry {
  const factory _NewBornEntry(
      {required final DateTime insertedAt,
      required final String sectorCode,
      required final String bedCode,
      required final DateTime entryDateTime,
      required final String newBornName,
      required final DateTime birthDateTime,
      required final String healthInsurance}) = _$NewBornEntryImpl;

  factory _NewBornEntry.fromJson(Map<String, dynamic> json) =
      _$NewBornEntryImpl.fromJson;

  @override
  DateTime get insertedAt;
  @override
  String get sectorCode;
  @override
  String get bedCode;
  @override
  DateTime get entryDateTime;
  @override
  String get newBornName;
  @override
  DateTime get birthDateTime;
  @override
  String get healthInsurance;
  @override
  @JsonKey(ignore: true)
  _$$NewBornEntryImplCopyWith<_$NewBornEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
