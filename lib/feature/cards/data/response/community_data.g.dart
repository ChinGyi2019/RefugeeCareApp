// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityData _$CommunityDataFromJson(Map<String, dynamic> json) =>
    CommunityData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      shortName: json['shortName'] as String?,
      logoImage: json['logoImage'] as String?,
      phoneNumber: (json['phoneNumber'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      description2: json['description2'] as String?,
      description3: json['description3'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CommunityDataToJson(CommunityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'shortName': instance.shortName,
      'logoImage': instance.logoImage,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'description2': instance.description2,
      'description3': instance.description3,
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
