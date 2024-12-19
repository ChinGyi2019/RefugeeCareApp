// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refugee_notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefugeeNotificationData _$RefugeeNotificationDataFromJson(
        Map<String, dynamic> json) =>
    RefugeeNotificationData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      communityId: json['communityId'] as String?,
      active: json['active'] as bool?,
      expiredDate: json['expiredDate'] as String?,
      createdAt: json['createdAt'] as String?,
      communityName: json['communityName'] as String?,
      communityShortName: json['communityShortName'] as String?,
    );

Map<String, dynamic> _$RefugeeNotificationDataToJson(
        RefugeeNotificationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'communityId': instance.communityId,
      'active': instance.active,
      'expiredDate': instance.expiredDate,
      'createdAt': instance.createdAt,
      'communityName': instance.communityName,
      'communityShortName': instance.communityShortName,
    };
