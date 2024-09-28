import 'package:refugee_care_mobile/data/datasource/auth_data_source.dart';
import 'package:refugee_care_mobile/data/datasource/model/user/user_data.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/domain/repositroy/auth_repository.dart';

class AuthRepositoryImpl implements AuthenticationRepository {
  final AuthDataSource dataSource;
  AuthRepositoryImpl(this.dataSource);
  @override
  Future<Either<AppException, User>> register({required User user}) {
    return dataSource.register(user: user);
  }
}
