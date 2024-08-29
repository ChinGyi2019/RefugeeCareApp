import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/data/uitls/exception_handaler_xmin.dart';
import 'package:refugee_care_mobile/data/uitls/response.dart';
import 'package:refugee_care_mobile/shared/constants/app_constant.dart';

class HttpNetworkService extends NetworkService with ExceptionHandlerMixin {
  final http.Client client;

  HttpNetworkService(this.client);

  @override
  String get baseUrl => AppConstant.baseURL;

  @override
  Map<String, String> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, String> updateHeader(Map<String, String> data) {
    final updatedHeaders = {...headers, ...data};
    return updatedHeaders;
  }

  @override
  Future<Either<AppException, Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return handleException(() async {
      final updatedHeaders = updateHeader({});
      final uri = Uri.parse('$baseUrl$endpoint')
          .replace(queryParameters: queryParameters);
      final response = await client.get(uri, headers: updatedHeaders);
      return response;
    });
  }

  @override
  Future<Either<AppException, Response>> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    return handleException(() async {
      final updatedHeaders = updateHeader({});
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await client.post(
        uri,
        headers: updatedHeaders,
        body: jsonEncode(data),
      );
      return response;
    });
  }
}
