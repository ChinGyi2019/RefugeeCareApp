// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseImpl _$$ResponseImplFromJson(Map<String, dynamic> json) =>
    _$ResponseImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String?,
      title: json['title'] as String?,
      identifier: json['identifier'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$$ResponseImplToJson(_$ResponseImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'title': instance.title,
      'identifier': instance.identifier,
      'data': instance.data,
    };
