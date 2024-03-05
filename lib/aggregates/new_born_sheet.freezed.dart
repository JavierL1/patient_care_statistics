// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_born_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewBornSheet {
  String get id => throw _privateConstructorUsedError;
  DateTime get insertedAt => throw _privateConstructorUsedError;
  String get sectorCode => throw _privateConstructorUsedError;
  String get bedCode => throw _privateConstructorUsedError;
  DateTime get entryDateTime => throw _privateConstructorUsedError;
  String get newBornName => throw _privateConstructorUsedError;
  DateTime get birthDateTime => throw _privateConstructorUsedError;
  int get lifeDays => throw _privateConstructorUsedError;
  Guardian? get mother => throw _privateConstructorUsedError;
  Guardian? get father => throw _privateConstructorUsedError;
  String get healthInsurance => throw _privateConstructorUsedError;
  HealthProfessional? get assignee => throw _privateConstructorUsedError;
  int get attentionCount => throw _privateConstructorUsedError;
  List<String> get procedures => throw _privateConstructorUsedError;
  bool get requiresFollowUp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewBornSheetCopyWith<NewBornSheet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewBornSheetCopyWith<$Res> {
  factory $NewBornSheetCopyWith(
          NewBornSheet value, $Res Function(NewBornSheet) then) =
      _$NewBornSheetCopyWithImpl<$Res, NewBornSheet>;
  @useResult
  $Res call(
      {String id,
      DateTime insertedAt,
      String sectorCode,
      String bedCode,
      DateTime entryDateTime,
      String newBornName,
      DateTime birthDateTime,
      int lifeDays,
      Guardian? mother,
      Guardian? father,
      String healthInsurance,
      HealthProfessional? assignee,
      int attentionCount,
      List<String> procedures,
      bool requiresFollowUp});

  $GuardianCopyWith<$Res>? get mother;
  $GuardianCopyWith<$Res>? get father;
  $HealthProfessionalCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$NewBornSheetCopyWithImpl<$Res, $Val extends NewBornSheet>
    implements $NewBornSheetCopyWith<$Res> {
  _$NewBornSheetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? insertedAt = null,
    Object? sectorCode = null,
    Object? bedCode = null,
    Object? entryDateTime = null,
    Object? newBornName = null,
    Object? birthDateTime = null,
    Object? lifeDays = null,
    Object? mother = freezed,
    Object? father = freezed,
    Object? healthInsurance = null,
    Object? assignee = freezed,
    Object? attentionCount = null,
    Object? procedures = null,
    Object? requiresFollowUp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      lifeDays: null == lifeDays
          ? _value.lifeDays
          : lifeDays // ignore: cast_nullable_to_non_nullable
              as int,
      mother: freezed == mother
          ? _value.mother
          : mother // ignore: cast_nullable_to_non_nullable
              as Guardian?,
      father: freezed == father
          ? _value.father
          : father // ignore: cast_nullable_to_non_nullable
              as Guardian?,
      healthInsurance: null == healthInsurance
          ? _value.healthInsurance
          : healthInsurance // ignore: cast_nullable_to_non_nullable
              as String,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as HealthProfessional?,
      attentionCount: null == attentionCount
          ? _value.attentionCount
          : attentionCount // ignore: cast_nullable_to_non_nullable
              as int,
      procedures: null == procedures
          ? _value.procedures
          : procedures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiresFollowUp: null == requiresFollowUp
          ? _value.requiresFollowUp
          : requiresFollowUp // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GuardianCopyWith<$Res>? get mother {
    if (_value.mother == null) {
      return null;
    }

    return $GuardianCopyWith<$Res>(_value.mother!, (value) {
      return _then(_value.copyWith(mother: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GuardianCopyWith<$Res>? get father {
    if (_value.father == null) {
      return null;
    }

    return $GuardianCopyWith<$Res>(_value.father!, (value) {
      return _then(_value.copyWith(father: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HealthProfessionalCopyWith<$Res>? get assignee {
    if (_value.assignee == null) {
      return null;
    }

    return $HealthProfessionalCopyWith<$Res>(_value.assignee!, (value) {
      return _then(_value.copyWith(assignee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewBornSheetImplCopyWith<$Res>
    implements $NewBornSheetCopyWith<$Res> {
  factory _$$NewBornSheetImplCopyWith(
          _$NewBornSheetImpl value, $Res Function(_$NewBornSheetImpl) then) =
      __$$NewBornSheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime insertedAt,
      String sectorCode,
      String bedCode,
      DateTime entryDateTime,
      String newBornName,
      DateTime birthDateTime,
      int lifeDays,
      Guardian? mother,
      Guardian? father,
      String healthInsurance,
      HealthProfessional? assignee,
      int attentionCount,
      List<String> procedures,
      bool requiresFollowUp});

  @override
  $GuardianCopyWith<$Res>? get mother;
  @override
  $GuardianCopyWith<$Res>? get father;
  @override
  $HealthProfessionalCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$NewBornSheetImplCopyWithImpl<$Res>
    extends _$NewBornSheetCopyWithImpl<$Res, _$NewBornSheetImpl>
    implements _$$NewBornSheetImplCopyWith<$Res> {
  __$$NewBornSheetImplCopyWithImpl(
      _$NewBornSheetImpl _value, $Res Function(_$NewBornSheetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? insertedAt = null,
    Object? sectorCode = null,
    Object? bedCode = null,
    Object? entryDateTime = null,
    Object? newBornName = null,
    Object? birthDateTime = null,
    Object? lifeDays = null,
    Object? mother = freezed,
    Object? father = freezed,
    Object? healthInsurance = null,
    Object? assignee = freezed,
    Object? attentionCount = null,
    Object? procedures = null,
    Object? requiresFollowUp = null,
  }) {
    return _then(_$NewBornSheetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      lifeDays: null == lifeDays
          ? _value.lifeDays
          : lifeDays // ignore: cast_nullable_to_non_nullable
              as int,
      mother: freezed == mother
          ? _value.mother
          : mother // ignore: cast_nullable_to_non_nullable
              as Guardian?,
      father: freezed == father
          ? _value.father
          : father // ignore: cast_nullable_to_non_nullable
              as Guardian?,
      healthInsurance: null == healthInsurance
          ? _value.healthInsurance
          : healthInsurance // ignore: cast_nullable_to_non_nullable
              as String,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as HealthProfessional?,
      attentionCount: null == attentionCount
          ? _value.attentionCount
          : attentionCount // ignore: cast_nullable_to_non_nullable
              as int,
      procedures: null == procedures
          ? _value._procedures
          : procedures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requiresFollowUp: null == requiresFollowUp
          ? _value.requiresFollowUp
          : requiresFollowUp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewBornSheetImpl implements _NewBornSheet {
  const _$NewBornSheetImpl(
      {required this.id,
      required this.insertedAt,
      required this.sectorCode,
      required this.bedCode,
      required this.entryDateTime,
      required this.newBornName,
      required this.birthDateTime,
      required this.lifeDays,
      required this.mother,
      required this.father,
      required this.healthInsurance,
      required this.assignee,
      required this.attentionCount,
      required final List<String> procedures,
      required this.requiresFollowUp})
      : _procedures = procedures;

  @override
  final String id;
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
  final int lifeDays;
  @override
  final Guardian? mother;
  @override
  final Guardian? father;
  @override
  final String healthInsurance;
  @override
  final HealthProfessional? assignee;
  @override
  final int attentionCount;
  final List<String> _procedures;
  @override
  List<String> get procedures {
    if (_procedures is EqualUnmodifiableListView) return _procedures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_procedures);
  }

  @override
  final bool requiresFollowUp;

  @override
  String toString() {
    return 'NewBornSheet(id: $id, insertedAt: $insertedAt, sectorCode: $sectorCode, bedCode: $bedCode, entryDateTime: $entryDateTime, newBornName: $newBornName, birthDateTime: $birthDateTime, lifeDays: $lifeDays, mother: $mother, father: $father, healthInsurance: $healthInsurance, assignee: $assignee, attentionCount: $attentionCount, procedures: $procedures, requiresFollowUp: $requiresFollowUp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewBornSheetImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.lifeDays, lifeDays) ||
                other.lifeDays == lifeDays) &&
            (identical(other.mother, mother) || other.mother == mother) &&
            (identical(other.father, father) || other.father == father) &&
            (identical(other.healthInsurance, healthInsurance) ||
                other.healthInsurance == healthInsurance) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee) &&
            (identical(other.attentionCount, attentionCount) ||
                other.attentionCount == attentionCount) &&
            const DeepCollectionEquality()
                .equals(other._procedures, _procedures) &&
            (identical(other.requiresFollowUp, requiresFollowUp) ||
                other.requiresFollowUp == requiresFollowUp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      insertedAt,
      sectorCode,
      bedCode,
      entryDateTime,
      newBornName,
      birthDateTime,
      lifeDays,
      mother,
      father,
      healthInsurance,
      assignee,
      attentionCount,
      const DeepCollectionEquality().hash(_procedures),
      requiresFollowUp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewBornSheetImplCopyWith<_$NewBornSheetImpl> get copyWith =>
      __$$NewBornSheetImplCopyWithImpl<_$NewBornSheetImpl>(this, _$identity);
}

abstract class _NewBornSheet implements NewBornSheet {
  const factory _NewBornSheet(
      {required final String id,
      required final DateTime insertedAt,
      required final String sectorCode,
      required final String bedCode,
      required final DateTime entryDateTime,
      required final String newBornName,
      required final DateTime birthDateTime,
      required final int lifeDays,
      required final Guardian? mother,
      required final Guardian? father,
      required final String healthInsurance,
      required final HealthProfessional? assignee,
      required final int attentionCount,
      required final List<String> procedures,
      required final bool requiresFollowUp}) = _$NewBornSheetImpl;

  @override
  String get id;
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
  int get lifeDays;
  @override
  Guardian? get mother;
  @override
  Guardian? get father;
  @override
  String get healthInsurance;
  @override
  HealthProfessional? get assignee;
  @override
  int get attentionCount;
  @override
  List<String> get procedures;
  @override
  bool get requiresFollowUp;
  @override
  @JsonKey(ignore: true)
  _$$NewBornSheetImplCopyWith<_$NewBornSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
