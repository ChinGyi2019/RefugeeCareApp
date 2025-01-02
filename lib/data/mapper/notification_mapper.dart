import 'package:refugee_care_mobile/domain/model/notification/refugee_notification.dart';
import 'package:refugee_care_mobile/feature/notification/data/model/refugee_notification_data.dart';
import 'package:refugee_care_mobile/shared/extensions/data_formatter.dart';

extension RefugeeNotificationDataMapper on RefugeeNotificationData {
  RefugeeNotification toDomain() {
    return RefugeeNotification(
      id: id ?? '',
      title: title ?? '',
      description: description ?? '',
      communityId: communityId ?? '',
      active: active ?? false,
      expiredDate: changeFormatDate(
          expiredDate ?? '', "yyyy-MM-ddTHH:mm", "dd MMM yyyy"),
      createdAt:
          changeFormatDate(createdAt ?? '', "yyyy-MM-ddTHH:mm", "dd MMM yyyy"),
      communityName: communityData?.name ?? '',
      communityShortName: communityData?.shortName ?? '',
    );
  }
}
