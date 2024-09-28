import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/data/datasource/model/user/user_data.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

abstract class AuthDataSource {
  Future<Either<AppException, User>> register({required User user});
}

class AuthDataSourceImpl implements AuthDataSource {
  final NetworkService networkService;
  final HiveHelper hiveHelper;

  AuthDataSourceImpl(this.networkService, this.hiveHelper);

  @override
  Future<Either<AppException, User>> register({required User user}) async {
    try {
      final eitherType = await networkService.post(
        '/register',
        data: user.toJson(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final user = User.fromJson(response.data);
          // update the token for requests
          hiveHelper.saveMainToken(user.token);
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
