import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/data/uitls/exception_handaler_xmin.dart';
import 'package:refugee_care_mobile/data/uitls/response.dart';
import 'package:refugee_care_mobile/shared/constants/app_constant.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

class HttpNetworkService extends NetworkService with ExceptionHandlerMixin {
  @override
  final http.Client client;
  HiveHelper hiveHelper;

  HttpNetworkService(this.client, this.hiveHelper);

  @override
  String get baseUrl => AppConstant.baseURL;

  @override
  Map<String, String> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, String> updateHeader(Map<String, String> data) {
    String? token = hiveHelper.getMainToken()?.token;
    final updatedHeaders = {
      ...headers,
      'Authorization': 'Bearer $token',
      ...data,
    };
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

  @override
  Future<Either<AppException, Response>> postMultipart(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, File>? files, // To support file uploads
  }) async {
    return handleException(() async {
      final updatedHeaders = updateHeader({});
      final uri = Uri.parse('$baseUrl$endpoint');

      // Create a MultipartRequest
      final request = http.MultipartRequest('POST', uri);

      request.headers.addAll(updatedHeaders);

      // Add fields from data to the multipart request
      data?.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add files to the multipart request if any
      if (files != null) {
        for (var entry in files.entries) {
          request.files.add(
              await http.MultipartFile.fromPath(entry.key, entry.value.path));
        }
      }

      // Send the request and await the response
      final streamedResponse = await client.send(request);
      final response = await http.Response.fromStream(streamedResponse);

      // Check if the request was successful and return response
      if (streamedResponse.statusCode == 200) {
        return response;
      } else {
        throw AppException(
          message: 'Failed to post data',
          statusCode: response.statusCode,
          title: 'Request Error',
          identifier: 'post',
        );
      }
    });
  }
}
