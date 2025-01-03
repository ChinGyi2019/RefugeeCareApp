import 'package:freezed_annotation/freezed_annotation.dart';

part 'refugee_notification.freezed.dart';
part 'refugee_notification.g.dart';

@freezed
class RefugeeNotification with _$RefugeeNotification {
  const factory RefugeeNotification({
    required String id,
    required String title,
    required String description,
    required bool active,
    required String expiredDate,
    required String createdAt,
    required String communityId,
    required String communityName,
    required String communityShortName,
  }) = _RefugeeNotification;

  factory RefugeeNotification.fromJson(Map<String, dynamic> json) =>
      _$RefugeeNotificationFromJson(json);
}
