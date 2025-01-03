// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdvertisementImpl _$$AdvertisementImplFromJson(Map<String, dynamic> json) =>
    _$AdvertisementImpl(
      title: json['title'] as String? ?? '',
      id: json['id'] as String? ?? '',
      tag: json['tag'] as String? ?? '',
      backDrop: json['backDrop'] as String? ?? '',
      date: json['date'] as String? ?? '',
      dateOfExpiry: json['dateOfExpiry'] as String? ?? '',
      owner: json['owner'] as String? ?? '',
      description: json['description'] as String? ?? '',
      communityId: json['communityId'] as String? ?? '',
      communityName: json['communityName'] as String? ?? '',
      communityShortName: json['communityShortName'] as String? ?? '',
    );

Map<String, dynamic> _$$AdvertisementImplToJson(_$AdvertisementImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'tag': instance.tag,
      'backDrop': instance.backDrop,
      'date': instance.date,
      'dateOfExpiry': instance.dateOfExpiry,
      'owner': instance.owner,
      'description': instance.description,
      'communityId': instance.communityId,
      'communityName': instance.communityName,
      'communityShortName': instance.communityShortName,
    };
