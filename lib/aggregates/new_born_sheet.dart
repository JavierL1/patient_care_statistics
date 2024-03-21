import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/sex.dart';
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
    required Sex sex,
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
        sex: Sex.other,
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
    List<Guardian> guardians,
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

        case "SET_GUARDIAN":
          return NewBornSheet.setGuardian(
            previousValue,
            element.data,
            guardians,
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
    final assignee = _resolveFromId<HealthProfessional>(
      data["assigneeId"],
      healthProfessionals,
      (healthProfessional) => healthProfessional.id,
    );
    return newBornSheet.copyWith(
      sectorCode: data["sectorCode"],
      bedCode: data["bedCode"],
      entryDateTime: DateTime.parse(data["entryDateTime"]),
      newBornName: data["newBornName"],
      sex: stringToSex(data["sex"]),
      birthDateTime: DateTime.parse(data["birthDateTime"]),
      healthInsurance: data["healthInsurance"],
      lifeDays: lifeDays,
      assignee: assignee,
    );
  }

  factory NewBornSheet.setGuardian(
    NewBornSheet newBornSheet,
    Map<String, dynamic> data,
    List<Guardian> guardians,
  ) {
    final guardianType = data["guardianType"];

    switch (guardianType) {
      case 'father':
        return newBornSheet.copyWith(
          father: _resolveFromId<Guardian>(
            data["guardianId"],
            guardians,
            (guardian) => guardian.id,
          ),
        );

      default:
        return newBornSheet.copyWith(
          mother: _resolveFromId<Guardian>(
            data["guardianId"],
            guardians,
            (guardian) => guardian.id,
          ),
        );
    }
  }
}

T? _resolveFromId<T>(String? id, List<T> items, String Function(T) getItemId) {
  if (id != null) {
    return items.firstWhereOrNull((element) => getItemId(element) == id);
  } else {
    return null;
  }
}
