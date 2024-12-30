import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';

part 'community_card.freezed.dart';
part 'community_card.g.dart';

@freezed
class CommunityCard with _$CommunityCard {
  const factory CommunityCard({
    @Default('') String name,
    @Default('') String id,
    @Default('') String title,
    @Default('') String cardNumber,
    @Default('') String type,
    @Default('') String dateOfBirth,
    @Default('') String gender,
    @Default('') String nationality,
    @Default('') String dateOfIssue,
    @Default('') String dateOfExpiry,
    @Default('') String communityId,
    @Default('') String passportPhoto,
    @Default('') String frontSidePhoto,
    @Default('') String backSidePhoto,
    @Default(null) String? uNHCRNumber,
    @Default(null) String? studentNumber,
    @Default(false) bool isVerified,
    @Default(Community()) Community community,
  }) = _CommunityCard;

  factory CommunityCard.fromJson(Map<String, dynamic> json) =>
      _$CommunityCardFromJson(json);

  factory CommunityCard.empty() {
    return CommunityCard(
      name: '',
      id: '',
      title: '',
      type: '',
      cardNumber: '',
      dateOfBirth: '',
      gender: '',
      nationality: '',
      dateOfIssue: '',
      dateOfExpiry: '',
      communityId: '',
      passportPhoto: '',
      frontSidePhoto: '',
      backSidePhoto: '',
      uNHCRNumber: '',
      studentNumber: '',
      isVerified: false,
      community: Community.empty(),
    );
  }
}


// import 'package:json_annotation/json_annotation.dart';
// import 'package:refugee_care_mobile/domain/model/community/community.dart';

// part 'community_card.g.dart';

// @JsonSerializable()
// class CommunityCard {
//   String name;
//   String id;
//   String title;
//   String cardNumber;
//   String type;
//   String dateOfBirth;
//   String gender;
//   String nationality;
//   String dateOfIssue;
//   String dateOfExpiry;
//   String communityId;
//   String passportPhoto;
//   String frontSidePhoto;
//   String backSidePhoto;
//   String? uNHCRNumber;
//   String? studentNumber;
//   bool isVerified;
//   // @JsonKey(includeFromJson: false, includeToJson: false)
//   Community community;

//   // Constructor with all required fields
//   CommunityCard(
//       {required this.name,
//       required this.id,
//       required this.cardNumber,
//       required this.title,
//       required this.type,
//       required this.dateOfBirth,
//       required this.gender,
//       required this.nationality,
//       required this.dateOfIssue,
//       required this.dateOfExpiry,
//       required this.passportPhoto,
//       required this.communityId,
//       required this.frontSidePhoto,
//       required this.backSidePhoto,
//       required this.uNHCRNumber,
//       required this.studentNumber,
//       required this.isVerified,
//       required this.community});
//   static CommunityCard empty() {
//     return CommunityCard(
//         name: '',
//         id: '',
//         title: '',
//         type: '',
//         cardNumber: '',
//         dateOfBirth: '',
//         gender: '',
//         nationality: '',
//         dateOfIssue: '',
//         dateOfExpiry: '',
//         communityId: '',
//         passportPhoto: '',
//         frontSidePhoto: '',
//         backSidePhoto: '',
//         uNHCRNumber: '',
//         studentNumber: '',
//         isVerified: false,
//         community: Community.empty());
//   }

//   factory CommunityCard.fromJson(Map<String, dynamic> json) =>
//       _$CommunityCardFromJson(json);

//   // Method to convert instance to JSON
//   Map<String, dynamic> toJson() => _$CommunityCardToJson(this);
// }
