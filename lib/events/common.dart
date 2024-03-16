import 'dart:convert';
import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';

Uint8List modelToBlob(dynamic object) {
  final Map<String, dynamic> jsonObject = object.toJson();
  final String jsonData = jsonEncode(jsonObject);
  return utf8.encode(jsonData);
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
