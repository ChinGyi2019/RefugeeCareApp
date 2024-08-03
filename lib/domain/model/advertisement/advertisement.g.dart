// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) =>
    Advertisement(
      title: json['title'] as String,
      id: json['id'] as String,
      tag: json['tag'] as String,
      backDrop: json['backDrop'] as String,
      date: json['date'] as String,
      dateOfExpiry: json['dateOfExpiry'] as String,
      owner: json['owner'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$AdvertisementToJson(Advertisement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'tag': instance.tag,
      'id': instance.id,
      'backDrop': instance.backDrop,
      'date': instance.date,
      'dateOfExpiry': instance.dateOfExpiry,
      'owner': instance.owner,
      'description': instance.description,
    };
