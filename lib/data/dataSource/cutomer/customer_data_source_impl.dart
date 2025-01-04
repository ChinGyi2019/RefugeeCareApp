import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/data/dataSource/cutomer/customer_data_soucre.dart';
import 'package:refugee_care_mobile/data/mapper/directory_mapper.dart';
import 'package:refugee_care_mobile/data/model/customer/advertisement_data.dart';
import 'package:refugee_care_mobile/data/mapper/advertisement_mapper.dart';
import 'package:refugee_care_mobile/data/mapper/notification_mapper.dart';
import 'package:refugee_care_mobile/data/model/directory/directory_data.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/domain/model/directory/directory.dart';
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
  }

  @override
  Future<Either<Exception, List<Advertisement>>> fetchAdvertisements() async {
    try {
      return databases.listDocuments(
        databaseId: EnvInfo.databaseId,
        collectionId: EnvInfo.advertisementCollectionId,
        queries: [],
      ).then((value) {
        final list =
            value.documents.map((e) => AdvertisementData.fromJson(e.data));
        debugPrint(value.toMap().toString());

        final advertisements = list.map((data) => data.toDomain()).toList();
        return Either.right(advertisements);
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
  Future<Either<Exception, List<Directory>>> fetchDirectories(
      List<String> tags) async {
    try {
      return databases.listDocuments(
        databaseId: EnvInfo.databaseId,
        collectionId: EnvInfo.directoryCollectionId,
        queries: [if (tags.isNotEmpty) Query.equal('tag', tags)],
      ).then((value) {
        final list = value.documents.map((e) => DirectoryData.fromJson(e.data));
        debugPrint(value.toMap().toString());

        final directories = list.map((data) => data.toDomain()).toList();
        return Either.right(directories);
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
}
