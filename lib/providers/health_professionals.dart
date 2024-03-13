import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../aggregates/health_professional.dart';
import '../events/base_event.dart';
import 'db.dart';

final healthProfessionalsProvider = FutureProvider<List<HealthProfessional>>(
  (ref) async {
    final db = ref.watch(dbInstanceProvider);
    if (db == null) return [];
    final healthProfessionalEvents = await db.query(
      'events',
      where: '"event_type" IN (?, ?)',
      whereArgs: [
        'CREATE_HEALTH_PROFESSIONAL',
        'UPDATE_HEALTH_PROFESSIONAL',
      ],
    );

    return healthProfessionalEvents
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
        .map((e) => HealthProfessional.reduceFromStream(e.key, e.value))
        .toList();
  },
  name: 'HealthProfessionals',
);
