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
      description2: json['description2'] as String?,
      description3: json['description3'] as String?,
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      phoneNumber: (json['phoneNumber'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CommunityToJson(Community instance) => <String, dynamic>{
      'name': instance.name,
      'shortName': instance.shortName,
      'id': instance.id,
      'logo': instance.logo,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'description2': instance.description2,
      'description3': instance.description3,
    };
