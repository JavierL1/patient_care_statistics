import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_event.freezed.dart';

@freezed
class BaseEvent with _$BaseEvent {
  const factory BaseEvent({
    required int id,
    required String streamId,
    required int version,
    required String eventType,
    required Map<String, dynamic> data,
    required DateTime timestamp,
  }) = _BaseEvent;

  factory BaseEvent.fromRawEvent(Map<String, dynamic> rawEvent) {
    final decodedBlob = utf8.decode(rawEvent['data']);
    final jsonData = json.decode(decodedBlob);
    final timestamp = DateTime.parse(rawEvent['timestamp']);

    return BaseEvent(
      id: rawEvent['id'],
      streamId: rawEvent['stream_id'],
      version: rawEvent['version'],
      eventType: rawEvent['event_type'],
      data: jsonData,
      timestamp: timestamp,
    );
  }
}
