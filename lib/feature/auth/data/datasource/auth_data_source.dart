import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/data/uitls/url.dart';
import 'package:refugee_care_mobile/feature/auth/domain/model/user/user.dart';
import 'package:refugee_care_mobile/data/services/network_services.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

abstract class AuthRemoteDataSource {
  Future<Either<AppException, User>> register({required User user});
  Future<Either<AppException, User>> login(
      {required String phoneNumber, required password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService networkService;
  final HiveHelper hiveHelper;

  AuthRemoteDataSourceImpl(this.networkService, this.hiveHelper);

  @override
  Future<Either<AppException, User>> register({required User user}) async {
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

  @override
  Future<Either<AppException, User>> login(
      {required String phoneNumber, required password}) async {
    try {
      final eitherType = await networkService.post(
        RefugeeURL.LOGIN_API,
        data: {"phoneNumber": phoneNumber, "password": password},
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
