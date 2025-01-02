import 'package:freezed_annotation/freezed_annotation.dart';
part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

@freezed
class Advertisement with _$Advertisement {
  const factory Advertisement({
    required String title,
    required String id,
    required String tag,
    required String backDrop,
    required String date,
    required String dateOfExpiry,
    required String owner,
    required String description,
  }) = _Advertisement;

  factory Advertisement.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementFromJson(json);
}
