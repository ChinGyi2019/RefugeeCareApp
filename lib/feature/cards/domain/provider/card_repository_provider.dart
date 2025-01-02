import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/data/services/app_write_client_provider.dart';
import 'package:refugee_care_mobile/di/locator.dart';
import 'package:refugee_care_mobile/feature/cards/data/datasource/card_remote_datasource.dart';
import 'package:refugee_care_mobile/feature/cards/data/datasource/card_remote_datasource_impl.dart';
import 'package:refugee_care_mobile/feature/cards/data/repository/card_repository_impl.dart';
import 'package:refugee_care_mobile/feature/cards/domain/repository/card_repository.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

// ignore: prefer_function_declarations_over_variables
final cardRemoteDatasourceProvider = Provider<CardRemoteDatasource>((ref) {
  final HiveHelper hiveHelper = locator<HiveHelper>();
  final databases = ref.watch(databaseProvider);
  final storage = ref.watch(storageProvider);
  final account = ref.watch(accountProvider);
  //  ref.watch(hiveHelperProvider.future);
  return CardRemoteDatasourceImpl(storage, hiveHelper, databases, account);
});

final cardRepositoryProvider = Provider<CardRepository>(
  (ref) {
    final CardRemoteDatasource cardRemoteDatasource =
        ref.watch(cardRemoteDatasourceProvider);
    final HiveHelper hiveHelper = locator<HiveHelper>();
    return CardRepositoryImpl(remote: cardRemoteDatasource);
  },
);
