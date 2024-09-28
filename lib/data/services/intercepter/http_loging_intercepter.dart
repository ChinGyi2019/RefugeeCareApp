import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoggingClient extends http.BaseClient {
  final http.Client _client;

  LoggingClient(this._client);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Log the request
    debugPrint("Request: ${request.method} ${request.url}");
    request.headers.forEach((key, value) {
      debugPrint("Header: $key = $value");
    });

    if (request is http.Request) {
      debugPrint("Body: ${request.body}");
    }

    // Send the request
    final response = await _client.send(request);

    // Log the response
    debugPrint("Response: ${response.statusCode}");
    debugPrint("Headers: ${response.headers}");

    // To log the response body, you need to read and store the body first
    var bodyBytes = await response.stream.toBytes();
    debugPrint("Body: ${String.fromCharCodes(bodyBytes)}");

    // Return a new StreamedResponse with the logged body data
    return http.StreamedResponse(
      http.ByteStream.fromBytes(bodyBytes),
      response.statusCode,
      headers: response.headers,
      reasonPhrase: response.reasonPhrase,
      request: response.request,
      isRedirect: response.isRedirect,
    );
  }

  // Close the client when done
  @override
  void close() {
    _client.close();
  }
}
