import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/di/locator.dart';
import 'package:refugee_care_mobile/feature/emergency/data/repository/contact_repository_impl.dart';
import 'package:refugee_care_mobile/feature/emergency/domain/repository/contact_repository.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

final contactRepositoryProvider = Provider<ContactRepository>(
  (ref) {
    final HiveHelper hiveHelper = locator<HiveHelper>();
    return ContactRepositoryImpl(hiveHelper: hiveHelper);
  },
);
