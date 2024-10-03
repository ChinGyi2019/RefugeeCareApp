import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

final hiveHelperProvider = FutureProvider<HiveHelper>((ref) async {
  final hiveHelper = HiveHelper();
  await hiveHelper.init(); // Ensure that Hive is initialized
  return hiveHelper;
});
