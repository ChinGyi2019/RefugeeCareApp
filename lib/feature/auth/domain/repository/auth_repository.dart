import 'package:refugee_care_mobile/feature/auth/domain/model/user/user.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';

abstract class AuthRepository {
  Future<Either<AppException, User>> register({required User user});
  Future<Either<AppException, User>> login(
      {required String phoneNumber, required password});

  Future<void> saveUser({required User user});

  User? getUser();
}
