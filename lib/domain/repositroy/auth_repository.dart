import 'package:refugee_care_mobile/data/datasource/model/user/user_data.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, User>> register({required User user});
}
