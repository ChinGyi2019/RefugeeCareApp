import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
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
  final Account account;

  AuthRemoteDataSourceImpl(this.networkService, this.hiveHelper, this.account);

  @override
  Future<Either<AppException, User>> register({required User user}) async {
    try {
      final email = "${user.phoneNumber}@refugeeCare.com";
      return await account
          .create(
        userId: ID.unique(),
        email: email,
        password: user.password ?? "",
        name: user.name,
      )
          .then((result) async {
        final newUser = User(
          id: result.$id,
          phoneNumber: "+65${user.phoneNumber ?? ''}",
          email: result.email,
          name: result.name,
          token: result.$id,
        );
        await account.createEmailPasswordSession(
            email: email, password: user.password ?? '');
        hiveHelper.saveMainToken(newUser..email = user.email);
        return Right(newUser);
      });
      // final email = "${user.phoneNumber}@refugeeCare.com";
      // final result = await account
      //     .create(
      //   userId: ID.unique(),
      //   email: email,
      //   password: user.password ?? "",
      //   name: user.name,
      // )
      //     .onError(
      //   (error, stackTrace) {
      //     debugPrint("error:$error");
      //     debugPrint("trace:$stackTrace");
      //     throw Exception("Error occurred during account registration");
      //   },
      // );
      // debugPrint(result.toString());
      // final newUser = User(
      //   id: result.$id,
      //   phoneNumber: "+65${user.phoneNumber ?? ''}",
      //   email: result.email,
      //   name: result.name,
      //   token: result.$id,
      // );
      // await account.deleteSession(sessionId: 'current');
      // await account.createEmailPasswordSession(
      //     email: email, password: user.password ?? '');

      // // Save the token and update the header
      // hiveHelper.saveMainToken(newUser..email = user.email);
      // return Right(newUser);
    } catch (e) {
      debugPrint("Exception: $e");
      if (e is AppwriteException) {
        debugPrint("AppwriteException: ${e.message}");
        return Left(
          AppException(
            message: e.message ?? 'Unknown error occurred',
            statusCode: e.code ?? 400,
            title: "Registration error",
            identifier: '${e.message}\nLoginUserRemoteDataSource.register',
          ),
        );
      } else {
        return Left(
          AppException(
            message: 'Unknown error occurred',
            statusCode: 400,
            title: "Unknown error",
            identifier: '${e.toString()}\nLoginUserRemoteDataSource.register',
          ),
        );
      }
    }
  }

  @override
  Future<Either<AppException, User>> login(
      {required String phoneNumber, required password}) async {
    try {
      // final result = await account.get();
      // debugPrint(result.toString());
      // if (phoneNumber == result.email.split('@')[0]) {
      //   return Right(User(
      //       id: result.$id,
      //       phoneNumber: result.email,
      //       email: result.email,
      //       name: result.name,
      //       token: result.$id));
      // }
      return await account
          .createEmailPasswordSession(
              email: "$phoneNumber@refugeecare.com", password: password)
          .onError((error, stackTrace) {
        debugPrint("error:$error");
        debugPrint("trace:$stackTrace");
        throw Exception("error:$error");
      }).then((_) async {
        final result = await account.get();
        debugPrint("result in $result");
        return Right(User(
            id: result.$id,
            phoneNumber: result.email,
            email: result.email,
            name: result.name,
            token: result.$id));
      });
    } catch (e) {
      debugPrint("Exception: $e");
      if (e is AppwriteException) {
        debugPrint("AppwriteException: ${e.message}");
        return Left(
          AppException(
            message: e.message ?? 'Unknown error occurred',
            statusCode: e.code ?? 400,
            title: "Login error",
            identifier: '${e.message}\nLoginUserRemoteDataSource.loginUser',
          ),
        );
      } else {
        return Left(
          AppException(
            message: 'Unknown error occurred',
            statusCode: 400,
            title: "Unknown error",
            identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
          ),
        );
      }
    }
  }
}
