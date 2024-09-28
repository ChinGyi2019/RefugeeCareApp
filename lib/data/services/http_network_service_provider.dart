import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:refugee_care_mobile/data/services/http_network_service.dart';
import 'package:refugee_care_mobile/data/services/intercepter/http_loging_intercepter.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  final client = http.Client();

  return HttpNetworkService(
      LoggingClient(client)); // Provide HttpNetworkService instance
});
