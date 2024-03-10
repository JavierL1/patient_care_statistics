import 'dart:io';

import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';

import '../dates/formatted_dates.dart';

Future<void> backupDBFile(String dbPath, String dbName) async {
  final backupFileName = '${dbName}_${nowFormatted()}.db';

  final dbFile = File(dbPath);
  final backupFile =
      await dbFile.copy(join(dbFile.parent.path, backupFileName));

  await Share.shareXFiles([XFile(backupFile.path)]);

  await backupFile.delete();
}
