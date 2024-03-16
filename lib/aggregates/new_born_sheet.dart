import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../events/base_event.dart';
import 'guardian.dart';
import 'health_professional.dart';

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

  factory NewBornSheet.initial() => NewBornSheet(
        id: "",
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

  factory NewBornSheet.reduceFromStream(
    String streamId,
    List<BaseEvent> events,
    List<HealthProfessional> healthProfessionals,
  ) {
    final now = DateTime.now();
    events.sort((a, b) => a.version.compareTo(b.version));
    final initialValue = NewBornSheet.initial().copyWith(id: streamId);

    return events.fold(initialValue, (previousValue, element) {
      switch (element.eventType) {
        case "CREATE_NEW_BORN_SHEET":
          return NewBornSheet.updateFromNewBornEntry(
            previousValue,
            element.data,
            now,
            healthProfessionals,
          ).copyWith(insertedAt: DateTime.parse(element.data["insertedAt"]));

        case "UPDATE_NEW_BORN_SHEET_BASE_FIELDS":
          return NewBornSheet.updateFromNewBornEntry(
            previousValue,
            element.data,
            now,
            healthProfessionals,
          );

        default:
          return previousValue;
      }
    });
  }

  factory NewBornSheet.updateFromNewBornEntry(
    NewBornSheet newBornSheet,
    Map<String, dynamic> data,
    DateTime now,
    List<HealthProfessional> healthProfessionals,
  ) {
    final birthDateTime = DateTime.parse(data["birthDateTime"]);
    final lifeDays = now.difference(birthDateTime).inDays;
    final assignee = _resolveHealthProfessional(data, healthProfessionals);
    return newBornSheet.copyWith(
      sectorCode: data["sectorCode"],
      bedCode: data["bedCode"],
      entryDateTime: DateTime.parse(data["entryDateTime"]),
      newBornName: data["newBornName"],
      birthDateTime: DateTime.parse(data["birthDateTime"]),
      healthInsurance: data["healthInsurance"],
      lifeDays: lifeDays,
      assignee: assignee,
    );
  }
}

HealthProfessional? _resolveHealthProfessional(
  Map<String, dynamic> data,
  List<HealthProfessional> healthProfessionals,
) {
  final String? assigneeId = data["assigneeId"];
  if (assigneeId != null) {
    return healthProfessionals
        .firstWhereOrNull((element) => element.id == assigneeId);
  } else {
    return null;
  }
}
