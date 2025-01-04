// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertisementData _$AdvertisementDataFromJson(Map<String, dynamic> json) =>
    AdvertisementData(
      title: json['title'] as String?,
      id: json['id'] as String?,
      tag: json['tag'] as String?,
      backDrop: json['backImage'] as String?,
      date: json[r'$createdAt'] as String?,
      dateOfExpiry: json['dateOfExpiry'] as String?,
      owner: json['owner'] as String?,
      description: json['description'] as String?,
      community: json['community'] == null
          ? null
          : CommunityData.fromJson(json['community'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdvertisementDataToJson(AdvertisementData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'tag': instance.tag,
      'backImage': instance.backDrop,
      r'$createdAt': instance.date,
      'dateOfExpiry': instance.dateOfExpiry,
      'owner': instance.owner,
      'description': instance.description,
      'community': instance.community,
    };
