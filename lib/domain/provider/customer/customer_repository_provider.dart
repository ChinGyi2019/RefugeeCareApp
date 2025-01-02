import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/data/dataSource/cutomer/customer_data_soucre.dart';
import 'package:refugee_care_mobile/data/dataSource/cutomer/customer_data_source_impl.dart';
import 'package:refugee_care_mobile/data/repository/customer/customer_repository_impl.dart';
import 'package:refugee_care_mobile/data/services/app_write_client_provider.dart';
import 'package:refugee_care_mobile/domain/repositroy/customer/customer_repository.dart';
import 'package:refugee_care_mobile/di/locator.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

final customerDataSourceProvider = Provider<CustomerDataSource>((ref) {
  final HiveHelper hiveHelper = locator<HiveHelper>();
  final account = ref.watch(accountProvider);
  final databases = ref.watch(databaseProvider);

  return CustomerDataSourceImpl(account, databases, hiveHelper);
});

final customerRepositoryProvider = Provider<CustomerRepository>(
  (ref) {
    final dataSource = ref.watch(customerDataSourceProvider);
    return CustomerRepositoryImpl(dataSource);
  },
);
