import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:refugee_care_mobile/data/response/refugee_response.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/data/uitls/response.dart';
import 'package:refugee_care_mobile/data/uitls/url.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:refugee_care_mobile/feature/cards/data/datasource/card_remote_datasource.dart';
import 'package:refugee_care_mobile/feature/cards/data/mapper/card_mapper.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/community_data.dart';
import 'package:refugee_care_mobile/shared/constants/app_constant.dart';
import 'package:refugee_care_mobile/shared/extensions/data_formatter.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';
import 'package:http/http.dart' as http;

class CardRemoteDatasourceImpl implements CardRemoteDatasource {
  final NetworkService networkService;
  final HiveHelper hiveHelper;

  CardRemoteDatasourceImpl(this.networkService, this.hiveHelper);
  @override
  Future<void> deleteCard(CommunityCard card) {
    // TODO: implement deleteCard
    throw UnimplementedError();
  }

  @override
  Future<void> editCard(CommunityCard card) {
    // TODO: implement editCard
    throw UnimplementedError();
  }

  @override
  Future<CommunityCard> getCardById(String id) {
    // TODO: implement getCardById
    throw UnimplementedError();
  }

  @override
  Future<List<CommunityCard>> getContactList() {
    // TODO: implement getContactList
    throw UnimplementedError();
  }

  @override
  Future<Either<AppException, List<CommunityCard>>> submitCard({
    required CommunityCard card,
  }) async {
    try {
      // Prepare the data fields
      final data = {
        'cardNumber': card.cardNumber,
        'fullName': card.name,
        'dateOfBirth': formatDate(card.dateOfBirth),
        'nationality': card.nationality,
        'dateOfIssue': formatDate(card.dateOfIssue),
        'dateOfexpiry': formatDate(card.dateOfExpiry),
        'gender': card.gender,
        'uNCardNumber': card.uNHCRNumber ?? '',
        'studentNumber': card.studentNumber ?? '',
        'status': card.isVerified.toString(),
        'communityId': card.communityId,
      };

      // Prepare the file fields
      final files = <String, File>{};
      if (card.passportPhoto.isNotEmpty) {
        files['passportPhoto'] = File(card.passportPhoto);
      }
      if (card.frontSidePhoto.isNotEmpty) {
        files['frontPhoto'] = File(card.frontSidePhoto);
      }
      if (card.backSidePhoto.isNotEmpty) {
        files['backPhoto'] = File(card.backSidePhoto);
      }

      // Send the multipart request using the postMultipart method
      final eitherResponse = await networkService.postMultipart(
        RefugeeURL.CARD_API,
        data: data,
        files: files,
      );

      // Check the result of the network request
      return eitherResponse.fold(
        (exception) => Left(exception),
        (response) async {
          if (response.statusCode == 200) {
            final data = jsonDecode(response.data);
            // final decodedResponse = Response.fromJson(responseData);
            // final data = decodedResponse.data;

            // Map the response data to a list of CommunityCard objects
            final cardList = (data as List)
                .map((json) => CommunityCard.fromJson(json))
                .toList();

            return Right(cardList);
          } else {
            return Left(AppException(
              message:
                  'Failed to create card. Status code: ${response.statusCode}',
              statusCode: response.statusCode,
              title: "Card Creation Error",
              identifier: 'cardCreate',
            ));
          }
        },
      );
    } catch (e) {
      return Left(AppException(
        message: 'Unknown error occurred while creating card',
        statusCode: 400,
        title: "Unknown error",
        identifier: '${e.toString()}\ncardCreate',
      ));
    }
  }

  @override
  Future<Either<AppException, List<Community>>> getCommunities() async {
    final eitherResponse = await networkService.get(RefugeeURL.COMMUNITY_API);
    return eitherResponse.fold((exception) => Left(exception),
        (response) async {
      final data = response.data as List<dynamic>;
      final list = data.map((json) {
        return CommunityData.fromJson(json);
      }).toList();

      final communities =
          list.map((communityData) => mapToCommunity(communityData)).toList();

      return Either.right(communities);
    });
  }

  // @override
  // Future<Either<AppException, List<CommunityCard>>> submitCard({
  //   required CommunityCard card,
  // }) async {
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse(AppConstant.baseURL + RefugeeURL.CARD_API));

  //   // Map the CommunityCard object's properties to the request fields
  //   request.fields['cardNumber'] = card.cardNumber;
  //   request.fields['fullName'] = card.name;
  //   request.fields['dateOfBirth'] = card.dateOfBirth;
  //   request.fields['nationality'] = card.nationality;
  //   request.fields['dateOfIssue'] = card.dateOfIssue;
  //   request.fields['dateOfexpiry'] = card.dateOfExpiry;
  //   request.fields['gender'] = card.gender;
  //   request.fields['uNCardNumber'] = card.uNHCRNumber ?? '';
  //   request.fields['studentNumber'] = card.studentNumber ?? '';
  //   request.fields['status'] = card.isVerified.toString();
  //   request.fields['communityId'] = card.id;

  //   // Add the file fields if provided
  //   if (card.passportPhoto.isNotEmpty) {
  //     request.files.add(await http.MultipartFile.fromPath(
  //         'passportPhoto', card.passportPhoto));
  //   }
  //   if (card.frontSidePhoto.isNotEmpty) {
  //     request.files.add(
  //         await http.MultipartFile.fromPath('frontPhoto', card.frontSidePhoto));
  //   }
  //   if (card.backSidePhoto.isNotEmpty) {
  //     request.files.add(
  //         await http.MultipartFile.fromPath('backPhoto', card.backSidePhoto));
  //   }

  //   try {
  //     // final eitherType = await networkService.post(
  //     //   RefugeeURL.REGISTER_API,
  //     //   data: user.toJson(),
  //     // );
  //     String? token = hiveHelper.getMainToken()?.token;
  //     networkService.updateHeader({
  //       if (token != null) 'Authorization': 'Bearer $token',
  //     });
  //     request.headers.addAll(networkService.headers);
  //     var response = await networkService.client.send(request);
  //     if (response.statusCode == 200) {
  //       final responseData = await response.stream.bytesToString();

  //       final rawResponse = jsonDecode(responseData) as Map<String, dynamic>;
  //       final decodedResponse = Response.fromJson(rawResponse);
  //       final data = decodedResponse.data;
  //       // Map the response data to a list of CommunityCard objects
  //       final cardList =
  //           data.map((json) => CommunityCard.fromJson(json)).toList();

  //       return Right(cardList);
  //     } else {
  //       return Left(AppException(
  //         message: 'Failed to create card. Status code: ${response.statusCode}',
  //         statusCode: response.statusCode,
  //         title: "Card Creation Error",
  //         identifier: 'cardCreate',
  //       ));
  //     }
  //   } catch (e) {
  //     return Left(AppException(
  //       message: 'Unknown error occurred while creating card',
  //       statusCode: 400,
  //       title: "Unknown error",
  //       identifier: '${e.toString()}\ncardCreate',
  //     ));
  //   }
  // }
  // @override
  // Future<void> submitCard(CommunityCard card) {
  //    try {
  //     final eitherType = await networkService.post(
  //       RefugeeURL.REGISTER_API,
  //       data: user.toJson(),
  //     );
  //     return eitherType.fold(
  //       (exception) {
  //         return Left(exception);
  //       },
  //       (response) {
  //         final user = User.fromJson(response.data);
  //         // update the token for requests
  //         hiveHelper.saveMainToken(user);
  //         networkService.updateHeader(
  //           {'Authorization': user.token ?? ""},
  //         );

  //         return Right(user);
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return Left(
  //       AppException(
  //         message: 'Unknown error occurred',
  //         statusCode: 400,
  //         title: "Unknow error",
  //         identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
  //       ),
  //     );
  //   }

  // }
}
