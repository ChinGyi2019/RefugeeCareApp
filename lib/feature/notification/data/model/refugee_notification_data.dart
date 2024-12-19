import 'package:json_annotation/json_annotation.dart';

part 'refugee_notification_data.g.dart';

@JsonSerializable()
class RefugeeNotificationData {
  final String? id;
  final String? title;
  final String? description;
  final String? communityId;
  final bool? active;
  final String? expiredDate;
  final String? createdAt;
  final String? communityName;
  final String? communityShortName;

  RefugeeNotificationData({
    this.id,
    this.title,
    this.description,
    this.communityId,
    this.active,
    this.expiredDate,
    this.createdAt,
    this.communityName,
    this.communityShortName,
  });

  factory RefugeeNotificationData.fromJson(Map<String, dynamic> json) =>
      _$RefugeeNotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$RefugeeNotificationDataToJson(this);
}
