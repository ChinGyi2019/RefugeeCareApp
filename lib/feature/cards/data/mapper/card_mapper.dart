import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/card/community_card_data.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/community/community_data.dart';
import 'package:refugee_care_mobile/shared/extensions/data_formatter.dart';

Community mapToCommunity(CommunityData? communityData) {
  return Community(
      name: communityData?.name ?? '',
      shortName: communityData?.shortName ?? '',
      id: communityData?.id ?? '',
      logo: communityData?.logoImage ?? '',
      description: communityData?.description ?? '',
      email: communityData?.email,
      phoneNumber: communityData?.phoneNumber,
      description2: communityData?.description2,
      description3: communityData?.description3);
}

CommunityCard mapToCommunityCard(CommunityCardData data) {
  return CommunityCard(
      name: data.fullName ??
          '', // Use fallback default values for nullable fields
      id: data.id ?? '',
      cardNumber: data.cardNumber ?? '',
      title: data.title ?? '',
      type: data.type ?? '',
      dateOfBirth: changeFormatDate(
          data.dateOfBirth ?? '', "yyyy-MM-ddTHH:mm:ssZ", "dd-MM-yyyy"),
      gender: data.gender ?? '',
      nationality: data.nationality ?? '',
      dateOfIssue: changeFormatDate(
          data.dateOfIssue ?? '', "yyyy-MM-ddTHH:mm:ssZ", "dd-MM-yyyy"),
      dateOfExpiry: changeFormatDate(
          data.dateOfExpiry ?? '', "yyyy-MM-ddTHH:mm:ssZ", "dd-MM-yyyy"),
      passportPhoto: data.passportPhoto ?? '',
      communityId: data.communityId ?? '',
      frontSidePhoto: data.frontSidePhoto ?? '',
      backSidePhoto: data.backSidePhoto ?? '',
      uNHCRNumber: data
          .uNHCRNumber, // Nullable in CommunityCardData, nullable in CommunityCard
      studentNumber: data
          .studentNumber, // Nullable in CommunityCardData, nullable in CommunityCard
      isVerified: data.isVerified ?? false,
      community: mapToCommunity(data.community) // Default false if null
      );
}
