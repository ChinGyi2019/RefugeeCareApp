// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refugee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefugeeResponse<T> _$RefugeeResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RefugeeResponse<T>(
      errorCode: (json['error_code'] as num?)?.toInt(),
      errorTitle: json['error_title'] as String?,
      errorMsg: json['error_msg'] as String?,
      currentDt: json['current_dt'] as String,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$RefugeeResponseToJson<T>(
  RefugeeResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_title': instance.errorTitle,
      'error_msg': instance.errorMsg,
      'current_dt': instance.currentDt,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
