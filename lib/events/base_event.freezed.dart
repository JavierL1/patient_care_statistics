// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseEvent {
  int get id => throw _privateConstructorUsedError;
  String get streamId => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseEventCopyWith<BaseEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseEventCopyWith<$Res> {
  factory $BaseEventCopyWith(BaseEvent value, $Res Function(BaseEvent) then) =
      _$BaseEventCopyWithImpl<$Res, BaseEvent>;
  @useResult
  $Res call(
      {int id,
      String streamId,
      int version,
      String eventType,
      Map<String, dynamic> data,
      DateTime timestamp});
}

/// @nodoc
class _$BaseEventCopyWithImpl<$Res, $Val extends BaseEvent>
    implements $BaseEventCopyWith<$Res> {
  _$BaseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? streamId = null,
    Object? version = null,
    Object? eventType = null,
    Object? data = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      streamId: null == streamId
          ? _value.streamId
          : streamId // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseEventImplCopyWith<$Res>
    implements $BaseEventCopyWith<$Res> {
  factory _$$BaseEventImplCopyWith(
          _$BaseEventImpl value, $Res Function(_$BaseEventImpl) then) =
      __$$BaseEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String streamId,
      int version,
      String eventType,
      Map<String, dynamic> data,
      DateTime timestamp});
}

/// @nodoc
class __$$BaseEventImplCopyWithImpl<$Res>
    extends _$BaseEventCopyWithImpl<$Res, _$BaseEventImpl>
    implements _$$BaseEventImplCopyWith<$Res> {
  __$$BaseEventImplCopyWithImpl(
      _$BaseEventImpl _value, $Res Function(_$BaseEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? streamId = null,
    Object? version = null,
    Object? eventType = null,
    Object? data = null,
    Object? timestamp = null,
  }) {
    return _then(_$BaseEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      streamId: null == streamId
          ? _value.streamId
          : streamId // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$BaseEventImpl implements _BaseEvent {
  const _$BaseEventImpl(
      {required this.id,
      required this.streamId,
      required this.version,
      required this.eventType,
      required final Map<String, dynamic> data,
      required this.timestamp})
      : _data = data;

  @override
  final int id;
  @override
  final String streamId;
  @override
  final int version;
  @override
  final String eventType;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'BaseEvent(id: $id, streamId: $streamId, version: $version, eventType: $eventType, data: $data, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.streamId, streamId) ||
                other.streamId == streamId) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, streamId, version, eventType,
      const DeepCollectionEquality().hash(_data), timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseEventImplCopyWith<_$BaseEventImpl> get copyWith =>
      __$$BaseEventImplCopyWithImpl<_$BaseEventImpl>(this, _$identity);
}

abstract class _BaseEvent implements BaseEvent {
  const factory _BaseEvent(
      {required final int id,
      required final String streamId,
      required final int version,
      required final String eventType,
      required final Map<String, dynamic> data,
      required final DateTime timestamp}) = _$BaseEventImpl;

  @override
  int get id;
  @override
  String get streamId;
  @override
  int get version;
  @override
  String get eventType;
  @override
  Map<String, dynamic> get data;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$BaseEventImplCopyWith<_$BaseEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
