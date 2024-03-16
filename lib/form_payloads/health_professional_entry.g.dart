// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_professional_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthProfessionalEntryImpl _$$HealthProfessionalEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthProfessionalEntryImpl(
      insertedAt: DateTime.parse(json['insertedAt'] as String),
      name: json['name'] as String,
      profession: json['profession'] as String,
    );

Map<String, dynamic> _$$HealthProfessionalEntryImplToJson(
        _$HealthProfessionalEntryImpl instance) =>
    <String, dynamic>{
      'insertedAt': instance.insertedAt.toIso8601String(),
      'name': instance.name,
      'profession': instance.profession,
    };
