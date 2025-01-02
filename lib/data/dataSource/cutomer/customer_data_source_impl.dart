import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/data/dataSource/cutomer/customer_data_soucre.dart';
import 'package:refugee_care_mobile/data/mapper/notification_mapper.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/domain/model/notification/refugee_notification.dart';
import 'package:refugee_care_mobile/feature/notification/data/model/refugee_notification_data.dart';
import 'package:refugee_care_mobile/main/appConfig/app_env.dart';

import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

class CustomerDataSourceImpl extends CustomerDataSource {
  final Account account;
  final Databases databases;
  final HiveHelper hiveHelper;

  CustomerDataSourceImpl(this.account, this.databases, this.hiveHelper);
  @override
  @override
  Future<Either<Exception, List<RefugeeNotification>>>
      fetchRefugeeNotifications() async {
    try {
      return databases.listDocuments(
        databaseId: EnvInfo.databaseId,
        collectionId: EnvInfo.notificationCollectionId,
        queries: [
          // Query.select(['name', '\$id', 'shortName']),
        ],
      ).then((value) {
        final list = value.documents
            .map((e) => RefugeeNotificationData.fromJson(e.data));
        debugPrint(value.toMap().toString());

        final notifications =
            list.map((communityData) => communityData.toDomain()).toList();
        return Either.right(notifications);
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
    //     return RefugeeNotificationData.fromJson(json);
    //   }).toList();

    //   final notifications = list.map((data) => data.toDomain()).toList();

    //   return Either.right(notifications);
    // });
  }

  @override
  Future<Either<Exception, List<Advertisement>>> fetchAdvertisements() {
    try {
      return databases.listDocuments(
        databaseId: EnvInfo.databaseId,
        collectionId: EnvInfo.notificationCollectionId,
        queries: [
          // Query.select(['name', '\$id', 'shortName']),
        ],
      ).then((value) {
        final list = value.documents
            .map((e) => RefugeeNotificationData.fromJson(e.data));
        debugPrint(value.toMap().toString());

        final notifications =
            list.map((communityData) => communityData.toDomain()).toList();
        return Either.right(notifications);
      });
    } catch (error) {
      return Left(AppException(
        message: 'Unknown error occurred while creating card',
        statusCode: 499,
        title: "Unknown error",
        identifier: '${error.toString()}\ncardCreate',
      ));
    }
  }

  @override
  Future<Either<Exception, List<Directory>>> fetchDirectories() {
    // TODO: implement fetchDirectories
    throw UnimplementedError();
  }
}
