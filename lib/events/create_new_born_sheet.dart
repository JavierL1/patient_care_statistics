import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../form_payloads/new_born_entry.dart';
import 'common.dart';

Future<int> createNewBornSheet(
  NewBornEntry newBornEntry,
  Database db,
  Uuid uuid,
) async {
  final streamId = uuid.v4();

  final data = modelToBlob(newBornEntry);

  return db.insert('events', {
    'stream_id': streamId,
    'version': 0,
    'event_type': "CREATE_NEW_BORN_SHEET",
    'data': data,
  });
}
