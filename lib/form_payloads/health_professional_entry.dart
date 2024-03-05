import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:patient_care_statistics/aggregates/health_professional.dart';

part 'health_professional_entry.freezed.dart';

@freezed
class HealthProfessionalEntry with _$HealthProfessionalEntry {
  const factory HealthProfessionalEntry({
    required DateTime insertedAt,
    required HealthProfessional healthProfessional,
  }) = _HealthProfessionalEntry;
}
