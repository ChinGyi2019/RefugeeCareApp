import 'package:refugee_care_mobile/data/dataSource/cutomer/customer_data_soucre.dart';
import 'package:refugee_care_mobile/data/mapper/notification_mapper.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/url.dart';
import 'package:refugee_care_mobile/domain/model/notification/refugee_notification.dart';
import 'package:refugee_care_mobile/feature/notification/data/model/refugee_notification_data.dart';

import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

class CustomerDataSourceImpl extends CustomerDataSource {
  final NetworkService networkService;
  final HiveHelper hiveHelper;

  CustomerDataSourceImpl(this.networkService, this.hiveHelper);
  @override
  @override
  Future<Either<Exception, List<RefugeeNotification>>>
      fetchRefugeeNotifications() async {
    final eitherResponse = await networkService.get(RefugeeURL.COMMUNITY_API);
    return eitherResponse.fold((exception) => Left(exception),
        (response) async {
      final data = response.data as List<dynamic>;
      final list = data.map((json) {
        return RefugeeNotificationData.fromJson(json);
      }).toList();

      final notifications = list.map((data) => data.toDomain()).toList();

      return Either.right(notifications);
    });
  }
}
