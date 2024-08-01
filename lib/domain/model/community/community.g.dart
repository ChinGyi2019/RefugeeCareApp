// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Community _$CommunityFromJson(Map<String, dynamic> json) => Community(
      name: json['name'] as String,
      id: json['id'] as String,
      shortName: json['shortName'] as String,
      logo: json['logo'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CommunityToJson(Community instance) => <String, dynamic>{
      'name': instance.name,
      'shortName': instance.shortName,
      'id': instance.id,
      'logo': instance.logo,
      'description': instance.description,
    };
