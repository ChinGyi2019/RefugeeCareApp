// Implement the CustomerRepository class using the Repository pattern
import 'package:refugee_care_mobile/data/dataSource/cutomer/customer_data_soucre.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/domain/model/notification/refugee_notification.dart';

import 'package:refugee_care_mobile/domain/repositroy/customer/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDataSource dataSource;

  CustomerRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, List<RefugeeNotification>>>
      fetchRefugeeNotifications() async {
    return dataSource.fetchRefugeeNotifications();
  }
}
