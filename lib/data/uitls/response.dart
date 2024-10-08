import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
part 'response.g.dart';
part 'response.freezed.dart';

@freezed
class Response with _$Response {
  const factory Response({
    required int statusCode,
    String? message,
    String? title,
    String? identifier,
    dynamic data,
  }) = _Response;
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  // Response(
  //     {required this.statusCode,
  //     this.statusTitle,
  //     this.statusMessage,
  //     this.data = const {}});
  // @override
  // String toString() {
  //   return 'statusCode=$statusCode\nstatusTitle=$statusTitle\nstatusMessage=$statusMessage\n data=$data';
  // }
}

extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
