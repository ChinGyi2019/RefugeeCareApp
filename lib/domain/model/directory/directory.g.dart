// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectoryImpl _$$DirectoryImplFromJson(Map<String, dynamic> json) =>
    _$DirectoryImpl(
      name: json['name'] as String? ?? '',
      job: json['job'] as String? ?? '',
      id: json['id'] as String? ?? '',
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      description: json['description'] as String,
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$DirectoryImplToJson(_$DirectoryImpl instance) =>
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
