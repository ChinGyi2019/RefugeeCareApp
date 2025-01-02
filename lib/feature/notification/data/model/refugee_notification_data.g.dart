// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refugee_notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefugeeNotificationData _$RefugeeNotificationDataFromJson(
        Map<String, dynamic> json) =>
    RefugeeNotificationData(
      id: json[r'$id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      communityId: json['communityId'] as String?,
      active: json['active'] as bool?,
      type: json['type'] as String?,
      expiredDate: json['expiredDate'] as String?,
      description2: json['description2'] as String?,
      description3: json['description3'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      communityData: json['community'] == null
          ? null
          : CommunityData.fromJson(json['community'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefugeeNotificationDataToJson(
        RefugeeNotificationData instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'description2': instance.description2,
      'description3': instance.description3,
      'type': instance.type,
      'communityId': instance.communityId,
      'active': instance.active,
      'expiredDate': instance.expiredDate,
      r'$createdAt': instance.createdAt,
      'community': instance.communityData,
    };
