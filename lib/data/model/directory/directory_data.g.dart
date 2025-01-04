// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectoryData _$DirectoryDataFromJson(Map<String, dynamic> json) =>
    DirectoryData(
      name: json['name'] as String?,
      id: json['id'] as String?,
      job: json['job'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DirectoryDataToJson(DirectoryData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
      'id': instance.id,
      'image': instance.image,
      'tag': instance.tag,
      'description': instance.description,
      'phone': instance.phone,
      'email': instance.email,
    };
