import 'package:refugee_care_mobile/feature/auth/data/datasource/auth_data_source.dart';
import 'package:refugee_care_mobile/feature/auth/domain/model/user/user.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/feature/auth/domain/repository/auth_repository.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;
  final HiveHelper hiveHelper;
  AuthRepositoryImpl(this.dataSource, this.hiveHelper);

  @override
  Future<Either<AppException, User>> register({required User user}) {
    return dataSource.register(user: user);
  }

  @override
  Future<void> saveUser({required User user}) {
    return hiveHelper.saveMainToken(user);
  }

  @override
  User? getUser() {
    return hiveHelper.getMainToken();
  }

  @override
  Future<Either<AppException, User>> login(
      {required String phoneNumber, required password}) {
    return dataSource.login(phoneNumber: phoneNumber, password: password);
  }
}
