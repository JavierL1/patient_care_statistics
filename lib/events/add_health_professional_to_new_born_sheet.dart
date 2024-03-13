import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../form_payloads/new_born_entry.dart';
import 'common.dart';

Future<int> updateNewBornSheetBaseFields(
  String streamId,
  NewBornEntry newBornEntry,
  Database db,
  Uuid uuid,
) async {
  final data = modelToBlob(newBornEntry);
  final latestVersion = await getLatestStreamVersion(streamId, db);

  return db.insert('events', {
    'stream_id': streamId,
    'version': latestVersion + 1,
    'event_type': "UPDATE_NEW_BORN_SHEET_BASE_FIELDS",
    'data': data,
  });
}

Future<int> getLatestStreamVersion(String streamId, Database db) async {
  final result = await db.query(
    'events',
    columns: ['version'],
    where: '"stream_id" = ?',
    whereArgs: [streamId],
    orderBy: '"version DESC"',
    limit: 1,
  );

  return result.first['version'] as int;
}
