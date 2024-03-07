import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../aggregates/new_born_sheet.dart';

Future<void> writeExcel(List<NewBornSheet> newBornSheets) async {
  print("UWU");

  if (await Permission.storage.request().isGranted) {
    print("HOLA");
    await _writeExcel(newBornSheets);
  }
}

Future<void> _writeExcel(List<NewBornSheet> newBornSheets) async {
  var excel = Excel.createExcel();
  Sheet excelSheet = excel['Estadísticas'];

  ['Sector', 'Cama'].asMap().forEach((key, value) {
    final cell = excelSheet.cell(
      CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: key),
    );
    cell.value = TextCellValue(value);
  });

  for (final (index, item) in newBornSheets.indexed) {
    final sectorCodeCell = excelSheet.cell(
      CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: index + 1),
    );
    sectorCodeCell.value = TextCellValue(item.sectorCode);
    final bedCodeCell = excelSheet.cell(
      CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: index + 1),
    );
    bedCodeCell.value = TextCellValue(item.bedCode);
  }

  var fileBytes = excel.save();
  var directory = await getApplicationDocumentsDirectory();

  File(join('$directory/output_file_name.xlsx'))
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);
}
