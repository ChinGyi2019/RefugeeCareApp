import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final String name;
  final String job;
  final String id;
  final String image;
  final String token;
  final String password;
  final String phone;
  final String email;
  Profile(
      {required this.name,
      required this.id,
      required this.job,
      required this.image,
      required this.token,
      required this.password,
      required this.email,
      required this.phone});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
