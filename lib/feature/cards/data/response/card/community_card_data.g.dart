// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityCardData _$CommunityCardDataFromJson(Map<String, dynamic> json) =>
    CommunityCardData(
      fullName: json['fullName'] as String?,
      id: json['id'] as String?,
      cardNumber: json['cardNumber'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      nationality: json['nationality'] as String?,
      dateOfIssue: json['dateOfIssue'] as String?,
      dateOfExpiry: json['dateOfExpiry'] as String?,
      passportPhoto: json['passportPhoto'] as String?,
      communityId: json['communityId'] as String?,
      frontSidePhoto: json['frontSidePhoto'] as String?,
      backSidePhoto: json['backSidePhoto'] as String?,
      uNHCRNumber: json['uNHCRNumber'] as String?,
      studentNumber: json['studentNumber'] as String?,
      isVerified: json['isVerified'] as bool?,
      community: json['community'] == null
          ? null
          : CommunityData.fromJson(json['community'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommunityCardDataToJson(CommunityCardData instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'id': instance.id,
      'title': instance.title,
      'cardNumber': instance.cardNumber,
      'type': instance.type,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'dateOfIssue': instance.dateOfIssue,
      'dateOfExpiry': instance.dateOfExpiry,
      'communityId': instance.communityId,
      'passportPhoto': instance.passportPhoto,
      'frontSidePhoto': instance.frontSidePhoto,
      'backSidePhoto': instance.backSidePhoto,
      'uNHCRNumber': instance.uNHCRNumber,
      'studentNumber': instance.studentNumber,
      'isVerified': instance.isVerified,
      'community': instance.community,
    };
