import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/data/datasource/auth_data_source.dart';
import 'package:refugee_care_mobile/data/repository/auth_repository_impl.dart';
import 'package:refugee_care_mobile/data/services/http_network_service_provider.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/domain/repositroy/auth_repository.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';
import 'package:refugee_care_mobile/shared/storage/hive_provider.dart';

// ignore: prefer_function_declarations_over_variables
final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final HiveHelper hiveHelper = ref.watch(hiveHelperProvider);
  return AuthDataSourceImpl(networkService, hiveHelper);
});

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    final AuthDataSource dataSource = ref.watch(authDataSourceProvider);
    return AuthRepositoryImpl(dataSource);
  },
);
