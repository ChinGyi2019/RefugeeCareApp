import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';

class AppException implements Exception {
  final String message;
  final int statusCode;
  final String title;
  final String identifier;

  AppException({
    required this.message,
    required this.title,
    required this.statusCode,
    required this.identifier,
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String get identifier => 'Cache failure exception';

  @override
  String get message => 'Unable to save user';

  @override
  int get statusCode => 100;

  @override
  String get title => "Cache Error";

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

//  extension

extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}
