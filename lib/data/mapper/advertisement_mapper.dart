import 'package:refugee_care_mobile/data/model/customer/advertisement_data.dart';
import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/shared/extensions/data_formatter.dart';

extension AdvertisementDataMapper on AdvertisementData {
  Advertisement toDomain() {
    return Advertisement(
      id: id ?? '',
      title: title ?? '',
      tag: tag ?? '',
      backDrop: backDrop ?? '',
      date: changeFormatDate(date ?? '', "yyyy-MM-ddTHH:mm", "dd MMM yyyy"),
      dateOfExpiry: dateOfExpiry ?? '',
      owner: owner ?? '',
      description: description ?? '',
      communityId: community?.id ?? '',
      communityName: community?.name ?? '',
      communityShortName: community?.shortName ?? '',
    );
  }
}
