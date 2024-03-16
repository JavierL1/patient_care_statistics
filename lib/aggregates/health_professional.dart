import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:patient_care_statistics/events/base_event.dart';

part 'health_professional.freezed.dart';
part 'health_professional.g.dart';

@freezed
class HealthProfessional with _$HealthProfessional {
  const factory HealthProfessional({
    required String id,
    required String name,
    required String profession,
    required DateTime insertedAt,
  }) = _HealthProfessional;

  factory HealthProfessional.fromJson(Map<String, dynamic> json) =>
      _$HealthProfessionalFromJson(json);

  factory HealthProfessional.initial() => HealthProfessional(
        id: "",
        name: "",
        profession: "",
        insertedAt: DateTime.now(),
      );

  factory HealthProfessional.reduceFromStream(
    String streamId,
    List<BaseEvent> events,
  ) {
    events.sort((a, b) => a.version.compareTo(b.version));
    final initialValue = HealthProfessional(
      id: streamId,
      name: "",
      profession: "",
      insertedAt: DateTime.now(),
    );

    return events.fold(initialValue, (previousValue, element) {
      switch (element.eventType) {
        case "CREATE_HEALTH_PROFESSIONAL":
          return HealthProfessional.updateFromEvent(
            previousValue,
            element.data,
          ).copyWith(insertedAt: DateTime.parse(element.data["insertedAt"]));

        case "UPDATE_HEALTH_PROFESSIONAL":
          return HealthProfessional.updateFromEvent(
            previousValue,
            element.data,
          );

        default:
          return previousValue;
      }
    });
  }

  factory HealthProfessional.updateFromEvent(
    HealthProfessional healthProfessional,
    Map<String, dynamic> data,
  ) =>
      healthProfessional.copyWith(
        name: data["name"],
        profession: data["profession"],
      );
}
