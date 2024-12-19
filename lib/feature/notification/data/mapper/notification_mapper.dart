import 'package:refugee_care_mobile/feature/notification/data/model/refugee_notification_data.dart';
import 'package:refugee_care_mobile/feature/notification/domain/model/notification/refugee_notification.dart';
import 'package:refugee_care_mobile/shared/extensions/data_formatter.dart';

extension RefugeeNotificationDataMapper on RefugeeNotificationData {
  RefugeeNotification toDomain() {
    return RefugeeNotification(
      date: changeFormatDate(
          expiredDate ?? '', "yyyy-MM-ddTHH:mm", "dd MMM yyyy"),
      id: id ?? '',
      title: title ?? '',
      description: description ?? '',
      type: communityShortName ?? '',
      dateOfExpiry: changeFormatDate(
          expiredDate ?? '', "yyyy-MM-ddTHH:mm", "dd MMM yyyy"),
      owner: communityName ?? '',
    );
  }
}
