// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_professional.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthProfessional _$HealthProfessionalFromJson(Map<String, dynamic> json) {
  return _HealthProfessional.fromJson(json);
}

/// @nodoc
mixin _$HealthProfessional {
  String get name => throw _privateConstructorUsedError;
  String get profession => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthProfessionalCopyWith<HealthProfessional> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthProfessionalCopyWith<$Res> {
  factory $HealthProfessionalCopyWith(
          HealthProfessional value, $Res Function(HealthProfessional) then) =
      _$HealthProfessionalCopyWithImpl<$Res, HealthProfessional>;
  @useResult
  $Res call({String name, String profession});
}

/// @nodoc
class _$HealthProfessionalCopyWithImpl<$Res, $Val extends HealthProfessional>
    implements $HealthProfessionalCopyWith<$Res> {
  _$HealthProfessionalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profession = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$HealthProfessionalImplCopyWith<$Res>
    implements $HealthProfessionalCopyWith<$Res> {
  factory _$$HealthProfessionalImplCopyWith(_$HealthProfessionalImpl value,
          $Res Function(_$HealthProfessionalImpl) then) =
      __$$HealthProfessionalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String profession});
}

/// @nodoc
class __$$HealthProfessionalImplCopyWithImpl<$Res>
    extends _$HealthProfessionalCopyWithImpl<$Res, _$HealthProfessionalImpl>
    implements _$$HealthProfessionalImplCopyWith<$Res> {
  __$$HealthProfessionalImplCopyWithImpl(_$HealthProfessionalImpl _value,
      $Res Function(_$HealthProfessionalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profession = null,
  }) {
    return _then(_$HealthProfessionalImpl(
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
class _$HealthProfessionalImpl implements _HealthProfessional {
  const _$HealthProfessionalImpl(
      {required this.name, required this.profession});

  factory _$HealthProfessionalImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthProfessionalImplFromJson(json);

  @override
  final String name;
  @override
  final String profession;

  @override
  String toString() {
    return 'HealthProfessional(name: $name, profession: $profession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthProfessionalImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profession, profession) ||
                other.profession == profession));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, profession);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthProfessionalImplCopyWith<_$HealthProfessionalImpl> get copyWith =>
      __$$HealthProfessionalImplCopyWithImpl<_$HealthProfessionalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthProfessionalImplToJson(
      this,
    );
  }
}

abstract class _HealthProfessional implements HealthProfessional {
  const factory _HealthProfessional(
      {required final String name,
      required final String profession}) = _$HealthProfessionalImpl;

  factory _HealthProfessional.fromJson(Map<String, dynamic> json) =
      _$HealthProfessionalImpl.fromJson;

  @override
  String get name;
  @override
  String get profession;
  @override
  @JsonKey(ignore: true)
  _$$HealthProfessionalImplCopyWith<_$HealthProfessionalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
