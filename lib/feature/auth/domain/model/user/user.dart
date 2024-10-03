import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(3)
  String? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? name;
  @HiveField(0)
  String? phoneNumber;
  @HiveField(4)
  String? token;
  String? password;
  User(
      {required this.name,
      required this.id,
      required this.email,
      this.password,
      required this.phoneNumber,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
