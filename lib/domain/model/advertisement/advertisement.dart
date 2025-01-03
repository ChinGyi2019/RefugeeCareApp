import 'package:freezed_annotation/freezed_annotation.dart';
part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

@freezed
class Advertisement with _$Advertisement {
  const factory Advertisement({
    @Default('') String title,
    @Default('') String id,
    @Default('') String tag,
    @Default('') String backDrop,
    @Default('') String date,
    @Default('') String dateOfExpiry,
    @Default('') String owner,
    @Default('') String description,
    @Default('') String communityId,
    @Default('') String communityName,
    @Default('') String communityShortName,
  }) = _Advertisement;

  factory Advertisement.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementFromJson(json);
}
