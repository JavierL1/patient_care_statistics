import 'package:freezed_annotation/freezed_annotation.dart';

import '../aggregates/health_professional.dart';

part 'health_professional_entry.freezed.dart';
part 'health_professional_entry.g.dart';

@freezed
class HealthProfessionalEntry with _$HealthProfessionalEntry {
  const factory HealthProfessionalEntry({
    required DateTime insertedAt,
    required String name,
    required String profession,
  }) = _HealthProfessionalEntry;

  factory HealthProfessionalEntry.fromJson(Map<String, dynamic> json) =>
      _$HealthProfessionalEntryFromJson(json);

  factory HealthProfessionalEntry.initial() => HealthProfessionalEntry(
        insertedAt: DateTime.now(),
        name: "",
        profession: "",
      );

  factory HealthProfessionalEntry.fromHealthProfessional(
    HealthProfessional healthProfessional,
  ) =>
      HealthProfessionalEntry(
        insertedAt: healthProfessional.insertedAt,
        name: healthProfessional.name,
        profession: healthProfessional.profession,
      );
}
