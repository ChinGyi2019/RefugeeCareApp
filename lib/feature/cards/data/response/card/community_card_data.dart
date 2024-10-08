import 'package:json_annotation/json_annotation.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/community/community_data.dart';

part 'community_card_data.g.dart';

@JsonSerializable()
class CommunityCardData {
  String? fullName;
  String? id;
  String? title;
  String? cardNumber;
  String? type;
  String? dateOfBirth;
  String? gender;
  String? nationality;
  String? dateOfIssue;
  String? dateOfExpiry;
  String? communityId;
  String? passportPhoto;
  String? frontSidePhoto;
  String? backSidePhoto;
  String? uNHCRNumber;
  String? studentNumber;
  bool? isVerified;
  CommunityData? community;

  // Constructor with all fields nullable
  CommunityCardData(
      {this.fullName,
      this.id,
      this.cardNumber,
      this.title,
      this.type,
      this.dateOfBirth,
      this.gender,
      this.nationality,
      this.dateOfIssue,
      this.dateOfExpiry,
      this.passportPhoto,
      this.communityId,
      this.frontSidePhoto,
      this.backSidePhoto,
      this.uNHCRNumber,
      this.studentNumber,
      this.isVerified,
      this.community});

  factory CommunityCardData.fromJson(Map<String, dynamic> json) =>
      _$CommunityCardDataFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$CommunityCardDataToJson(this);
}
