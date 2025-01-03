// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refugee_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefugeeNotificationImpl _$$RefugeeNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$RefugeeNotificationImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      active: json['active'] as bool,
      expiredDate: json['expiredDate'] as String,
      createdAt: json['createdAt'] as String,
      communityId: json['communityId'] as String,
      communityName: json['communityName'] as String,
      communityShortName: json['communityShortName'] as String,
    );

Map<String, dynamic> _$$RefugeeNotificationImplToJson(
        _$RefugeeNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'active': instance.active,
      'expiredDate': instance.expiredDate,
      'createdAt': instance.createdAt,
      'communityId': instance.communityId,
      'communityName': instance.communityName,
      'communityShortName': instance.communityShortName,
    };
