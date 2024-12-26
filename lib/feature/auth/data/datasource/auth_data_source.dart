import 'package:appwrite/appwrite.dart';
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
  final Account account;

  AuthRemoteDataSourceImpl(this.networkService, this.hiveHelper, this.account);

  @override
  Future<Either<AppException, User>> register({required User user}) async {
    try {
      final email = "${user.phoneNumber}@refugeeCare.com";
      final result = await account
          .create(
        userId: ID.unique(),
        email: email,
        password: user.password ?? "",
        name: user.name,
      )
          .onError(
        (error, stackTrace) {
          debugPrint("error:$error");
          debugPrint("trace:$stackTrace");
          throw Exception("Error occurred during account registration");
        },
      );
      debugPrint(result.toString());
      final newUser = User(
        id: result.$id,
        phoneNumber: "+65${user.phoneNumber ?? ''}",
        email: result.email,
        name: result.name,
        token: result.$id,
      );
      await account.deleteSession(sessionId: 'current');
      await account.createEmailPasswordSession(
          email: email, password: user.password ?? '');

      // Save the token and update the header
      hiveHelper.saveMainToken(newUser..email = user.email);
      return Right(newUser);
    } catch (e) {
      debugPrint("error:$e");
      debugPrint("trace:$e");
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 400,
          title: "Unknow error",
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.register',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, User>> login(
      {required String phoneNumber, required password}) async {
    try {
      // session.$id
      // debugPrint(session.toString());
      // if (session.userId == "$phoneNumber@refugeecare.com") {
      //   return Right(User(
      //       id: session.userId,
      //       phoneNumber: session.userId,
      //       email: session.userId,
      //       name: session.userId,
      //       token: session.userId));
      // }
      final newSession = await account
          .createEmailPasswordSession(
              email: "$phoneNumber@refugeecare.com", password: password)
          .onError((error, stackTrace) {
        debugPrint("error:$error");
        debugPrint("trace:$stackTrace");
        throw Exception("error:$error");
      });
      // if (newSession.current) {
      //   return Left(
      //     AppException(
      //       message: 'Invalid email or password',
      //       statusCode: 400,
      //       title: "Invalid email or password",
      //       identifier:
      //           'Invalid email or password\nLoginUserRemoteDataSource.loginUser',
      //     ),
      //   );
      // }
      //final result = await account.get();
      return Right(
          User(id: '', phoneNumber: '', email: '', name: '', token: ''));
      // return Right(User(
      //     id: result.$id,
      //     phoneNumber: result.email,
      //     email: result.email,
      //     name: result.name,
      //     token: result.$id));
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
