import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/data/uitls/url.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/feature/cards/data/datasource/card_remote_datasource.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

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
  Future<void> submitCard(CommunityCard card) {
     try {
      final eitherType = await networkService.post(
        RefugeeURL.REGISTER_API,
        data: user.toJson(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final user = User.fromJson(response.data);
          // update the token for requests
          hiveHelper.saveMainToken(user);
          networkService.updateHeader(
            {'Authorization': user.token ?? ""},
          );

          return Right(user);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 400,
          title: "Unknow error",
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  
  }
}
