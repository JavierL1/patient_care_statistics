import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:patient_care_statistics/aggregates/new_born_sheet.dart';

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
    required DateTime birthDateTime,
    required String healthInsurance,
  }) = _NewBornEntry;

  factory NewBornEntry.fromJson(Map<String, dynamic> json) =>
      _$NewBornEntryFromJson(json);

  factory NewBornEntry.initial() => NewBornEntry(
        insertedAt: DateTime.now(),
        sectorCode: "",
        bedCode: "",
        entryDateTime: DateTime.now(),
        newBornName: "",
        birthDateTime: DateTime.now(),
        healthInsurance: "",
      );

  factory NewBornEntry.fromSheet(NewBornSheet sheet) => NewBornEntry(
        insertedAt: sheet.insertedAt,
        sectorCode: sheet.sectorCode,
        bedCode: sheet.bedCode,
        entryDateTime: sheet.entryDateTime,
        newBornName: sheet.newBornName,
        birthDateTime: sheet.birthDateTime,
        healthInsurance: sheet.healthInsurance,
      );
}
