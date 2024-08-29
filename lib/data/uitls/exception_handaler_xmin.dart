import 'dart:io';

import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/data/uitls/response.dart' as response;
import 'package:http/http.dart' as http;

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>> handleException(
      Future<http.Response> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          statusCode: res.statusCode,
          data: res
              .body, // Adjust this based on how your Response model handles the body (string, JSON, etc.)
          statusMessage: res.reasonPhrase,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      debugPrint(e.runtimeType.toString());
      switch (e.runtimeType) {
        case const (SocketException):
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case const (http.ClientException):
          e as http.ClientException;
          message = e.message ?? 'Internal Error occurred';
          statusCode = 1;
          identifier = 'ClientException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
