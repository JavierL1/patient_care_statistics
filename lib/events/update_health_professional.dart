import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../form_payloads/health_professional_entry.dart';
import 'common.dart';

Future<int> updateHealthProfessional(
  String streamId,
  HealthProfessionalEntry healthProfessional,
  Database db,
  Uuid uuid,
) async {
  final data = modelToBlob(healthProfessional);
  final latestVersion = await getLatestStreamVersion(streamId, db);

  return db.insert('events', {
    'stream_id': streamId,
    'version': latestVersion + 1,
    'event_type': "UPDATE_HEALTH_PROFESSIONAL",
    'data': data,
  });
}
