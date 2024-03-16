import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../form_payloads/health_professional_entry.dart';
import 'common.dart';

Future<int> createHealthProfessional(
  HealthProfessionalEntry healthProfessionalEntry,
  Database db,
  Uuid uuid,
) async {
  final streamId = uuid.v4();

  final data = modelToBlob(healthProfessionalEntry);

  return db.insert('events', {
    'stream_id': streamId,
    'version': 0,
    'event_type': "CREATE_HEALTH_PROFESSIONAL",
    'data': data,
  });
}
