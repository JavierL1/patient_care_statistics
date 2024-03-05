import 'package:freezed_annotation/freezed_annotation.dart';

part 'guardian.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Guardian with _$Guardian {
  const factory Guardian({
    required String name,
    required String rut,
    required String nationality,
    required String sex,
    required String age,
    required String ocupation,
    required List<String> diagnostics,
    required String phoneNumber,
    required String commune,
  }) = _Guardian;
}
