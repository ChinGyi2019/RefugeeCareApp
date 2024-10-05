import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/community_data.dart';

Community mapToCommunity(CommunityData communityData) {
  return Community(
    name: communityData.name ?? '',
    shortName: communityData.shortName ?? '',
    id: communityData.id ?? '',
    logo: communityData.logoImage ?? '',
    description: communityData.description ?? '',
    email: communityData.email,
    phoneNumber: communityData.phoneNumber,
  );
}
