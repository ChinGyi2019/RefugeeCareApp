// Define the abstract CustomerRepository class
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/domain/model/notification/refugee_notification.dart';

abstract class CustomerRepository {
  Future<Either<Exception, List<RefugeeNotification>>>
      fetchRefugeeNotifications();
}
