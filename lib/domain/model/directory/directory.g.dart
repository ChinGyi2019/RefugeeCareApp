// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Directory _$DirectoryFromJson(Map<String, dynamic> json) => Directory(
      name: json['name'] as String,
      id: json['id'] as String,
      job: json['job'] as String,
      image: json['image'] as String,
      tag: (json['tag'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      email: json['email'] as String,
      phone: (json['phone'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DirectoryToJson(Directory instance) => <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
      'id': instance.id,
      'image': instance.image,
      'tag': instance.tag,
      'description': instance.description,
      'phone': instance.phone,
      'email': instance.email,
    };
