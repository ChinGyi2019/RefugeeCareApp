import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

final hiveHelperProvider = Provider<HiveHelper>((ref) {
  return HiveHelper()..init();
});
