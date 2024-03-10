import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final dbInstanceProvider = Provider<Database?>(
  (ref) => null,
  name: 'Database Instance',
);

final dbNameProvider = Provider<String>(
  (ref) => '',
  name: 'Database Name',
);

final dbPathProvider = Provider<String>(
  (ref) => '',
  name: 'Database Path',
);
