import 'package:json_annotation/json_annotation.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/community/community_data.dart';

part 'refugee_notification_data.g.dart';

@JsonSerializable()
class RefugeeNotificationData {
  @JsonKey(name: '\$id')
  final String? id;
  final String? title;
  final String? description;
  final String? description2;
  final String? description3;
  final String? type;
  final String? communityId;
  final bool? active;
  final String? expiredDate;
  @JsonKey(name: '\$createdAt')
  final String? createdAt;
  @JsonKey(name: 'community')
  final CommunityData? communityData;

  RefugeeNotificationData(
      {this.id,
      this.title,
      this.description,
      this.communityId,
      this.active,
      this.type,
      this.expiredDate,
      this.description2,
      this.description3,
      this.createdAt,
      this.communityData});

  factory RefugeeNotificationData.fromJson(Map<String, dynamic> json) =>
      _$RefugeeNotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$RefugeeNotificationDataToJson(this);
}
