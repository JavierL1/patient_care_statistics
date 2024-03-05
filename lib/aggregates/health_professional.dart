import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_professional.freezed.dart';
part 'health_professional.g.dart';

@freezed
class HealthProfessional with _$HealthProfessional {
  const factory HealthProfessional({
    required String name,
    required String profession,
  }) = _HealthProfessional;

  factory HealthProfessional.fromJson(Map<String, dynamic> json) =>
      _$HealthProfessionalFromJson(json);
}
