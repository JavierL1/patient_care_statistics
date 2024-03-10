import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_care_statistics/aggregates/new_born_sheet.dart';
import 'package:patient_care_statistics/events/base_event.dart';
import 'package:patient_care_statistics/providers/db.dart';

final newBornSheetsProvider = FutureProvider<List<NewBornSheet>>(
  (ref) async {
    final db = ref.watch(dbInstanceProvider);
    if (db == null) return [];
    final newBornSheetEvents = await db.query(
      'events',
      where: '"event_type" IN (?, ?)',
      whereArgs: [
        'CREATE_NEW_BORN_SHEET',
        'UPDATE_NEW_BORN_SHEET_BASE_FIELDS',
      ],
    );

    return newBornSheetEvents
        .map((e) => BaseEvent.fromRawEvent(e))
        .toList()
        .fold(<String, List<BaseEvent>>{}, (previousValue, event) {
          String key = event.streamId;
          if (!previousValue.containsKey(key)) {
            previousValue[key] = [];
          }
          previousValue[key]?.add(event);
          return previousValue;
        })
        .entries
        .map((e) => NewBornSheet.reduceFromStream(e.key, e.value))
        .toList();
  },
  name: 'NewBornSheets',
);
