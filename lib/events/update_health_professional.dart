import 'package:patient_care_statistics/events/common.dart';
import 'package:patient_care_statistics/form_payloads/health_professional_entry.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

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
