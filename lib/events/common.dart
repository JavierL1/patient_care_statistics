import 'dart:convert';
import 'dart:typed_data';

Uint8List modelToBlob(dynamic object) {
  final Map<String, dynamic> jsonObject = object.toJson();
  final String jsonData = jsonEncode(jsonObject);
  return utf8.encode(jsonData);
}
