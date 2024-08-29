import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'contact.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Contact extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String phoneNumber;
  @HiveField(2)
  String id;
  @HiveField(3)
  String logo;
  @HiveField(4)
  String description;
  Contact(
      {required this.name,
      required this.id,
      required this.phoneNumber,
      required this.logo,
      required this.description});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
