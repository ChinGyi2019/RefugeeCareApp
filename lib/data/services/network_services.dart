import 'dart:io';

import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/data/uitls/response.dart';
import 'package:http/http.dart' as http;

abstract class NetworkService {
  String get baseUrl;
  http.Client get client;
  Map<String, String> get headers;

  void updateHeader(Map<String, String> data);

  Future<Either<AppException, Response>> get(String endpoint,
      {Map<String, String>? queryParameters});

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
  Future<Either<AppException, Response>> postMultipart(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, File>? files, // To support file uploads
  });
}
