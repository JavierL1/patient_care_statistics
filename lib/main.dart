import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:patient_care_statistics/providers/db.dart';
import 'package:patient_care_statistics/providers/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'router.dart';
import 'routes.dart';
import 'providers/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  const dbName = 'patient_care_statistics';
  final dbPath = join(await getDatabasesPath(), '$dbName.db');
  final database = await openDatabase(
    dbPath,
    onCreate: (db, version) {
      return db.execute(
        '''
        CREATE TABLE events(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          stream_id TEXT NOT NULL,
          version INTEGER NOT NULL,
          event_type TEXT NOT NULL,
          data BLOB,
          timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
        );
        CREATE INDEX IF NOT EXISTS stream_id_index ON events(stream_id);
        ''',
      );
    },
    version: 1,
  );
  const uuid = Uuid();

  runApp(ProviderScope(
    observers: const [],
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      dbInstanceProvider.overrideWithValue(database),
      dbPathProvider.overrideWithValue(dbPath),
      dbNameProvider.overrideWithValue(dbName),
      uuidProvider.overrideWithValue(uuid),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient Care Statistics',
      initialRoute: newBornSheetsRoute,
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
