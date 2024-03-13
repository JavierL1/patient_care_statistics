// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_professional.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthProfessionalImpl _$$HealthProfessionalImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthProfessionalImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profession: json['profession'] as String,
      insertedAt: DateTime.parse(json['insertedAt'] as String),
    );

Map<String, dynamic> _$$HealthProfessionalImplToJson(
        _$HealthProfessionalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profession': instance.profession,
      'insertedAt': instance.insertedAt.toIso8601String(),
    };
