import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/auth/data/datasource/auth_data_source.dart';
import 'package:refugee_care_mobile/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:refugee_care_mobile/data/services/http_network_service_provider.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/di/locator.dart';
import 'package:refugee_care_mobile/feature/auth/domain/repository/auth_repository.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

// ignore: prefer_function_declarations_over_variables
final authDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final HiveHelper hiveHelper = locator<HiveHelper>();
  //  ref.watch(hiveHelperProvider.future);
  return AuthRemoteDataSourceImpl(networkService, hiveHelper);
});

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    final AuthRemoteDataSource dataSource = ref.watch(authDataSourceProvider);
    final HiveHelper hiveHelper = locator<HiveHelper>();
    return AuthRepositoryImpl(dataSource, hiveHelper);
  },
);
