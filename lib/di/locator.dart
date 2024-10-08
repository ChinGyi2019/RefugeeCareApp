import 'package:get_it/get_it.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  HiveHelper hiveHelper = HiveHelper();
  await hiveHelper.init();

  locator.registerSingleton<HiveHelper>(hiveHelper);
}

// locator.registerSingleton<SharedPreferences>(sharedPreferences);
// locator.registerLazySingleton(
  //     () => SharedPreferencesService(locator<SharedPreferences>()));