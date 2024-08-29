import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/data/uitls/response.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, String> data);

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, String>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
