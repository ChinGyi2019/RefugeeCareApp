// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityImpl _$$CommunityImplFromJson(Map<String, dynamic> json) =>
    _$CommunityImpl(
      name: json['name'] as String? ?? '',
      shortName: json['shortName'] as String? ?? '',
      id: json['id'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      phoneNumber: (json['phoneNumber'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String? ?? '',
      description2: json['description2'] as String?,
      description3: json['description3'] as String?,
    );

Map<String, dynamic> _$$CommunityImplToJson(_$CommunityImpl instance) =>
    <String, dynamic>{
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
