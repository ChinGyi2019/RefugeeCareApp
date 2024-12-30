// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityCardImpl _$$CommunityCardImplFromJson(Map<String, dynamic> json) =>
    _$CommunityCardImpl(
      name: json['name'] as String? ?? '',
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      cardNumber: json['cardNumber'] as String? ?? '',
      type: json['type'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      dateOfIssue: json['dateOfIssue'] as String? ?? '',
      dateOfExpiry: json['dateOfExpiry'] as String? ?? '',
      communityId: json['communityId'] as String? ?? '',
      passportPhoto: json['passportPhoto'] as String? ?? '',
      frontSidePhoto: json['frontSidePhoto'] as String? ?? '',
      backSidePhoto: json['backSidePhoto'] as String? ?? '',
      uNHCRNumber: json['uNHCRNumber'] as String? ?? null,
      studentNumber: json['studentNumber'] as String? ?? null,
      isVerified: json['isVerified'] as bool? ?? false,
      community: json['community'] == null
          ? const Community()
          : Community.fromJson(json['community'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommunityCardImplToJson(_$CommunityCardImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
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
