import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:refugee_care_mobile/data/services/http_network_service.dart';
import 'package:refugee_care_mobile/data/services/intercepter/http_loging_intercepter.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/di/locator.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  final client = http.Client();
  final HiveHelper hiveHelper = locator<HiveHelper>();
  return HttpNetworkService(
      LoggingClient(client), hiveHelper); // Provide HttpNetworkService instance
});
