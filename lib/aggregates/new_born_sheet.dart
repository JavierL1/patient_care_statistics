import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:patient_care_statistics/aggregates/guardian.dart';
import 'package:patient_care_statistics/aggregates/health_professional.dart';

import '../events/base_event.dart';

part 'new_born_sheet.freezed.dart';

@freezed
class NewBornSheet with _$NewBornSheet {
  const factory NewBornSheet({
    required String id,
    required DateTime insertedAt,
    required String sectorCode,
    required String bedCode,
    required DateTime entryDateTime,
    required String newBornName,
    required DateTime birthDateTime,
    required int lifeDays,
    required Guardian? mother,
    required Guardian? father,
    required String healthInsurance,
    required HealthProfessional? assignee,
    required int attentionCount,
    required List<String> procedures,
    required bool requiresFollowUp,
  }) = _NewBornSheet;

  factory NewBornSheet.reduceFromStream(
    String streamId,
    List<BaseEvent> events,
  ) {
    final now = DateTime.now();
    events.sort((a, b) => a.version.compareTo(b.version));
    final initialValue = NewBornSheet(
      id: streamId,
      insertedAt: DateTime.now(),
      sectorCode: "",
      bedCode: "",
      entryDateTime: DateTime.now(),
      newBornName: "",
      birthDateTime: DateTime.now(),
      lifeDays: 0,
      healthInsurance: "",
      assignee: null,
      mother: null,
      father: null,
      attentionCount: 0,
      procedures: [],
      requiresFollowUp: true,
    );

    return events.fold(initialValue, (previousValue, element) {
      switch (element.eventType) {
        case "CREATE_NEW_BORN_SHEET":
          final birthDateTime = DateTime.parse(element.data["birthDateTime"]);
          final lifeDays = now.difference(birthDateTime).inDays;
          return previousValue.copyWith(
            insertedAt: DateTime.parse(element.data["insertedAt"]),
            sectorCode: element.data["sectorCode"],
            bedCode: element.data["bedCode"],
            entryDateTime: DateTime.parse(element.data["entryDateTime"]),
            newBornName: element.data["newBornName"],
            birthDateTime: DateTime.parse(element.data["birthDateTime"]),
            healthInsurance: element.data["healthInsurance"],
            lifeDays: lifeDays,
          );
        default:
          return previousValue;
      }
    });
  }
}
