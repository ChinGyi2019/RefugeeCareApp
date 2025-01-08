import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/card/community_card_data.dart';
import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:refugee_care_mobile/feature/cards/data/datasource/card_remote_datasource.dart';
import 'package:refugee_care_mobile/feature/cards/data/mapper/card_mapper.dart';
import 'package:refugee_care_mobile/feature/cards/data/response/community/community_data.dart';
import 'package:refugee_care_mobile/main/appConfig/app_env.dart';
import 'package:refugee_care_mobile/shared/extensions/data_formatter.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

class CardRemoteDatasourceImpl implements CardRemoteDatasource {
  final Storage storage;
  final HiveHelper hiveHelper;
  final Databases databases;
  final Account account;
  final Teams team;

  CardRemoteDatasourceImpl(
      this.storage, this.hiveHelper, this.databases, this.account, this.team);
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
  Future<Either<AppException, List<CommunityCard>>> getCards() async {
    try {
      final user = await account.get();
      return databases.listDocuments(
          databaseId: EnvInfo.databaseId,
          collectionId: EnvInfo.cardCollectionId,
          queries: [Query.equal('userId', user.$id)]).then((value) {
        final list =
            value.documents.map((e) => CommunityCardData.fromJson(e.data));

        final cards = list.map((data) => mapToCommunityCard(data)).toList();

        return Either.right(cards);
      });
    } catch (error) {
      return Left(AppException(
        message: 'Unknown error occurred while creating card',
        statusCode: 499,
        title: "Unknown error",
        identifier: '${error.toString()}\ncardCreate',
      ));
    }

    // final eitherResponse = await networkService.get(RefugeeURL.CARD_API);
    // return eitherResponse.fold((exception) => Left(exception),
    //     (response) async {
    //   final data = response.data as List<dynamic>;
    //   final list = data.map((json) {
    //     return CommunityCardData.fromJson(json);
    //   }).toList();

    //   final cards = list.map((data) => mapToCommunityCard(data)).toList();

    //   return Either.right(cards);
    // });
  }

  @override
  Future<Either<AppException, List<CommunityCard>>> submitCard({
    required CommunityCard card,
  }) async {
    try {
      final cardID = ID.unique();
      final user = await account.get();
      // Check file sizes (under 2 MB for each file)

      //frontPhoto
      final frontPhotoFile = File(card.frontSidePhoto);
      final backPhotoFile = File(card.backSidePhoto);
      final passportPhotoFile = File(card.passportPhoto);
      if (frontPhotoFile.lengthSync() > 2 * 1024 * 1024 ||
          backPhotoFile.lengthSync() > 2 * 1024 * 1024 ||
          passportPhotoFile.lengthSync() > 2 * 1024 * 1024) {
        return Left(AppException(
          message: 'Each File size should be under 2 MB',
          statusCode: 400,
          title: "File Size Error",
          identifier: 'fileSizeCheck',
        ));
      }
      final uploadedFrontFile = await storage
          .createFile(
        bucketId: EnvInfo.buckedId,
        fileId: ID.unique(),
        file: InputFile.fromPath(
            path: frontPhotoFile.path, filename: 'image.jpg'),
      )
          .then((value) {
        debugPrint(value.toMap().toString());
        return value;
      }).onError((error, stackTrace) {
        debugPrint("error:$error");
        debugPrint("strace:$stackTrace");
        throw Exception("error:$error");
      });

      final uploadedBackFile = await storage.createFile(
        bucketId: EnvInfo.buckedId,
        fileId: ID.unique(),
        file: InputFile.fromPath(
            path: backPhotoFile.path,
            filename: frontPhotoFile.path.split('/').last),
      );

      final uploadedPassportFile = await storage.createFile(
        bucketId: EnvInfo.buckedId,
        fileId: ID.unique(),
        file: InputFile.fromPath(
            path: passportPhotoFile.path,
            filename: passportPhotoFile.path.split('/').last),
      );
      final data = {
        'cardNumber': card.cardNumber,
        'fullName': card.name,
        'dateOfBirth': formatDate(card.dateOfBirth),
        'nationality': card.nationality,
        'dateOfIssue': formatDate(card.dateOfIssue),
        'dateOfExpiry': formatDate(card.dateOfExpiry),
        'gender': card.gender,
        'uNCardNumber': card.uNHCRNumber ?? '',
        'studentNumber': card.studentNumber ?? '',
        'status': card.isVerified.toString(),
        'community': card.communityId,
        'userId': user.$id,
        'passportPhoto': uploadedPassportFile.$id,
        'frontPhoto': uploadedFrontFile.$id,
        'backPhoto': uploadedBackFile.$id
      };
      return await databases.createDocument(
          databaseId: EnvInfo.databaseId,
          collectionId: EnvInfo.cardCollectionId,
          documentId: cardID,
          data: data,
          permissions: [
            Permission.read(Role.users()),
            Permission.update(Role.users()),
            Permission.delete(Role.users()),
          ]).then((value) async {
        debugPrint(value.toMap().toString());
        return await databases.listDocuments(
            databaseId: EnvInfo.databaseId,
            collectionId: EnvInfo.cardCollectionId,
            queries: [Query.equal('userId', user.$id)]).then((value) {
          final list =
              value.documents.map((e) => CommunityCardData.fromJson(e.data));
          final cards = list.map((data) => mapToCommunityCard(data)).toList();
          return Either.right(cards);
        });
      });
      // Prepare the data fields
      // final data = {
      //   'cardNumber': card.cardNumber,
      //   'fullName': card.name,
      //   'dateOfBirth': formatDate(card.dateOfBirth),
      //   'nationality': card.nationality,
      //   'dateOfIssue': formatDate(card.dateOfIssue),
      //   'dateOfexpiry': formatDate(card.dateOfExpiry),
      //   'gender': card.gender,
      //   'uNCardNumber': card.uNHCRNumber ?? '',
      //   'studentNumber': card.studentNumber ?? '',
      //   'status': card.isVerified.toString(),
      //   'communityId': card.communityId,
      // };

      // // Prepare the file fields
      // final files = <String, File>{};
      // if (card.passportPhoto.isNotEmpty) {
      //   files['passportPhoto'] = File(card.passportPhoto);
      // }
      // if (card.frontSidePhoto.isNotEmpty) {
      //   files['frontPhoto'] = File(card.frontSidePhoto);
      // }
      // if (card.backSidePhoto.isNotEmpty) {
      //   files['backPhoto'] = File(card.backSidePhoto);
      // }

      // // Send the multipart request using the postMultipart method
      // final eitherResponse = await networkService.postMultipart(
      //   RefugeeURL.CARD_API,
      //   data: data,
      //   files: files,
      // );

      // // Check the result of the network request
      // return eitherResponse.fold((exception) => Left(exception),
      //     (response) async {
      //   final data = response.data as List<dynamic>;
      //   final list = data.map((json) {
      //     return CommunityCardData.fromJson(json);
      //   }).toList();

      //   final cards = list.map((data) => mapToCommunityCard(data)).toList();

      //   return Either.right(cards);
      // });
    } catch (e, strace) {
      debugPrint("error:$e");
      debugPrint("strace:$strace");
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
    try {
      return databases.listDocuments(
        databaseId: EnvInfo.databaseId,
        collectionId: EnvInfo.communityCollectionId,
        queries: [
          // Query.select(['name', '\$id', 'shortName']),
        ],
      ).then((value) {
        final list = value.documents.map((e) => CommunityData.fromJson(e.data));
        debugPrint(value.toMap().toString());

        final communities =
            list.map((communityData) => mapToCommunity(communityData)).toList();
        return Either.right(communities);
      });
    } catch (error) {
      return Left(AppException(
        message: 'Unknown error occurred while creating card',
        statusCode: 499,
        title: "Unknown error",
        identifier: '${error.toString()}\ncardCreate',
      ));
    }
    // final eitherResponse = await networkService.get(RefugeeURL.COMMUNITY_API);
    // return eitherResponse.fold((exception) => Left(exception),
    //     (response) async {
    //   final data = response.data as List<dynamic>;
    //   final list = data.map((json) {
    //     return CommunityData.fromJson(json);
    //   }).toList();

    //   final communities =
    //       list.map((communityData) => mapToCommunity(communityData)).toList();

    //   return Either.right(communities);
    // });
  }

  @override
  Future<Either<AppException, String>> report(String offficerType, String city,
      {required CommunityCard card}) {
    // TODO: implement report
    throw UnimplementedError();
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
