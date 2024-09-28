import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'refugee_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class RefugeeResponse<T> {
  @JsonKey(name: 'error_code')
  final int? errorCode;

  @JsonKey(name: 'error_title')
  final String? errorTitle;

  @JsonKey(name: 'error_msg')
  final String? errorMsg;

  @JsonKey(name: 'current_dt')
  final String currentDt;

  final T? data;

  RefugeeResponse({
    required this.errorCode,
    required this.errorTitle,
    required this.errorMsg,
    required this.currentDt,
    this.data,
  });

  factory RefugeeResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$RefugeeResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$RefugeeResponseToJson(this, toJsonT);
}
