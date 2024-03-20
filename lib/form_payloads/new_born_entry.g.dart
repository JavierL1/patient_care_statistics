// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_born_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewBornEntryImpl _$$NewBornEntryImplFromJson(Map<String, dynamic> json) =>
    _$NewBornEntryImpl(
      insertedAt: DateTime.parse(json['insertedAt'] as String),
      sectorCode: json['sectorCode'] as String,
      bedCode: json['bedCode'] as String,
      entryDateTime: DateTime.parse(json['entryDateTime'] as String),
      newBornName: json['newBornName'] as String,
      sex: $enumDecode(_$SexEnumMap, json['sex']),
      birthDateTime: DateTime.parse(json['birthDateTime'] as String),
      healthInsurance: json['healthInsurance'] as String,
      assigneeId: json['assigneeId'] as String?,
    );

Map<String, dynamic> _$$NewBornEntryImplToJson(_$NewBornEntryImpl instance) =>
    <String, dynamic>{
      'insertedAt': instance.insertedAt.toIso8601String(),
      'sectorCode': instance.sectorCode,
      'bedCode': instance.bedCode,
      'entryDateTime': instance.entryDateTime.toIso8601String(),
      'newBornName': instance.newBornName,
      'sex': _$SexEnumMap[instance.sex]!,
      'birthDateTime': instance.birthDateTime.toIso8601String(),
      'healthInsurance': instance.healthInsurance,
      'assigneeId': instance.assigneeId,
    };

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
  Sex.other: 'other',
};
