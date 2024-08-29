import 'package:get_it/get_it.dart';
import 'package:refugee_care_mobile/data/repository/contact_repository_impl.dart';
import 'package:refugee_care_mobile/domain/repositroy/contact_repository.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  HiveHelper hiveHelper = HiveHelper();
  await hiveHelper.init();

  locator.registerSingleton<HiveHelper>(hiveHelper);

  locator.registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl(
        hiveHelper: locator<HiveHelper>(),
      ));
}

// locator.registerSingleton<SharedPreferences>(sharedPreferences);
// locator.registerLazySingleton(
  //     () => SharedPreferencesService(locator<SharedPreferences>()));