import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/community/community_data.dart';

part 'advertisement_data.g.dart';

@JsonSerializable()
class AdvertisementData {
  const AdvertisementData(
      {this.title,
      this.id,
      this.tag,
      this.backDrop,
      this.date,
      this.dateOfExpiry,
      this.owner,
      this.description,
      this.community});

  final String? title;
  final String? id;
  final String? tag;
  final String? backDrop;
  @JsonKey(name: '\$createdAt')
  final String? date;
  final String? dateOfExpiry;
  final String? owner;
  final String? description;
  final CommunityData? community;

  factory AdvertisementData.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementDataFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementDataToJson(this);
}
