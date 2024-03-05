import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final dbProvider = Provider<Database?>(
  (ref) => null,
  name: 'Database',
);
