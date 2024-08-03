import 'package:json_annotation/json_annotation.dart';

part 'advertisement.g.dart';

@JsonSerializable()
class Advertisement {
  final String title;
  final String tag;
  final String id;
  final String backDrop;
  final String date;
  final String dateOfExpiry;
  final String owner;
  final String description;
  Advertisement(
      {required this.title,
      required this.id,
      required this.tag,
      required this.backDrop,
      required this.date,
      required this.dateOfExpiry,
      required this.owner,
      required this.description});

  static List<Advertisement> dummyCommunities = [];

  factory Advertisement.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementToJson(this);
}
