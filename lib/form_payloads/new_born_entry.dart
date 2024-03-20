import 'package:freezed_annotation/freezed_annotation.dart';

import '../aggregates/new_born_sheet.dart';
import '../enums/sex.dart';

part 'new_born_entry.freezed.dart';
part 'new_born_entry.g.dart';

@freezed
class NewBornEntry with _$NewBornEntry {
  const factory NewBornEntry({
    required DateTime insertedAt,
    required String sectorCode,
    required String bedCode,
    required DateTime entryDateTime,
    required String newBornName,
    required Sex sex,
    required DateTime birthDateTime,
    required String healthInsurance,
    required String? assigneeId,
  }) = _NewBornEntry;

  factory NewBornEntry.fromJson(Map<String, dynamic> json) =>
      _$NewBornEntryFromJson(json);

  factory NewBornEntry.initial() => NewBornEntry(
        insertedAt: DateTime.now(),
        sectorCode: "",
        bedCode: "",
        entryDateTime: DateTime.now(),
        newBornName: "",
        sex: Sex.other,
        birthDateTime: DateTime.now(),
        healthInsurance: "",
        assigneeId: null,
      );

  factory NewBornEntry.fromSheet(NewBornSheet sheet) => NewBornEntry(
        insertedAt: sheet.insertedAt,
        sectorCode: sheet.sectorCode,
        bedCode: sheet.bedCode,
        entryDateTime: sheet.entryDateTime,
        newBornName: sheet.newBornName,
        sex: sheet.sex,
        birthDateTime: sheet.birthDateTime,
        healthInsurance: sheet.healthInsurance,
        assigneeId: sheet.assignee?.id,
      );
}
