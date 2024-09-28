import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data.g.dart';
part 'user_data.freezed.dart';

@freezed
class User with _$User {
  factory User(
      {String? id,
      String? email,
      String? name,
      String? phoneNumber,
      String? token,
      String? password}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
