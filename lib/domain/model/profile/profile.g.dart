// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      name: json['name'] as String,
      id: json['id'] as String,
      job: json['job'] as String,
      image: json['image'] as String,
      token: json['token'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
      'id': instance.id,
      'image': instance.image,
      'token': instance.token,
      'password': instance.password,
      'phone': instance.phone,
      'email': instance.email,
    };
