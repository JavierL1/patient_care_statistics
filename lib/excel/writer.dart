import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../aggregates/new_born_sheet.dart';
import '../dates/formatted_dates.dart';

Future<void> writeExcel(List<NewBornSheet> newBornSheets) async {
  if (Platform.isAndroid) {
    final storagePermissionTypes = [
      Permission.storage,
      Permission.manageExternalStorage
    ];

    Map<Permission, PermissionStatus> statuses =
        await storagePermissionTypes.request();

    final anyStoragePermissionIsGranted = storagePermissionTypes
        .map((statusType) => statuses[statusType]?.isGranted ?? false)
        .any((isGranted) => isGranted);

    if (anyStoragePermissionIsGranted) await _writeExcel(newBornSheets);
  } else {
    await _writeExcel(newBornSheets);
  }
}

Future<void> _writeExcel(List<NewBornSheet> newBornSheets) async {
  var excel = Excel.createExcel();
  Sheet excelSheet = excel.sheets.entries.first.value;

  final headers = [
    'Sector',
    'Cama',
    'Nombre RN',
    'Fecha de registro',
    'Fecha de nacimiento',
    'Días de vida',
    'Previsión de salud',
  ];

  _writeHeaders(excelSheet, headers);
  _writeBody(excelSheet, newBornSheets);

  final excelFile = await _writeExcelFile(excel);

  if (Platform.isAndroid) await Share.shareXFiles([XFile(excelFile.path)]);
}

void _writeHeaders(Sheet excelSheet, List<String> headers) {
  headers.asMap().forEach((key, value) {
    final cell = excelSheet.cell(
      CellIndex.indexByColumnRow(columnIndex: key, rowIndex: 0),
    );
    cell.value = TextCellValue(value);
  });
}

void _writeBody(Sheet excelSheet, List<NewBornSheet> newBornSheets) {
  for (final (index, item) in newBornSheets.indexed) {
    final rowIndex = index + 1;

    final cellValues = [
      TextCellValue(item.sectorCode),
      TextCellValue(item.bedCode),
      TextCellValue(item.newBornName),
      DateTimeCellValue.fromDateTime(item.entryDateTime),
      DateTimeCellValue.fromDateTime(item.birthDateTime),
      FormulaCellValue("DAYS(TODAY(), E${rowIndex + 1})"),
      TextCellValue(item.healthInsurance),
    ];

    for (var (columnIndex, cellValue) in cellValues.indexed) {
      void Function(Data cell)? setCellStyle;

      switch (cellValue) {
        case DateCellValue():
          setCellStyle = _setDateTimeCellStyle;
          break;
        case DateTimeCellValue():
          setCellStyle = _setDateTimeCellStyle;
          break;
        default:
          setCellStyle = null;
          break;
      }

      _updateCellValue(
        excelSheet: excelSheet,
        columnIndex: columnIndex,
        rowIndex: rowIndex,
        value: cellValue,
        setCellStyle: setCellStyle,
      );
    }
  }
}

void _setDateTimeCellStyle(Data cell) {
  cell.cellStyle = (cell.cellStyle ?? CellStyle()).copyWith(
    numberFormat: const CustomDateTimeNumFormat(formatCode: "d/m/yy h:mm"),
  );
}

void _updateCellValue({
  required Sheet excelSheet,
  required int columnIndex,
  required int rowIndex,
  required CellValue value,
  void Function(Data cell)? setCellStyle,
}) {
  final cell = excelSheet.cell(
    CellIndex.indexByColumnRow(columnIndex: columnIndex, rowIndex: rowIndex),
  );
  cell.value = value;
  if (setCellStyle != null) setCellStyle(cell);
}

Future<File> _writeExcelFile(Excel excel) async {
  var fileBytes = excel.save();
  var directory = await getApplicationDocumentsDirectory();

  final file =
      File(join('${directory.path}/estadísticas_${nowFormatted()}.xlsx'));

  file
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

  return file;
}
