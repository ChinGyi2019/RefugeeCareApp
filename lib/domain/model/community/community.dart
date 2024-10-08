import 'package:json_annotation/json_annotation.dart';

part 'community.g.dart';

@JsonSerializable()
class Community {
  final String name;
  final String shortName;
  final String id;
  final String logo;
  final String description;
  final List<String>? email;
  final List<String>? phoneNumber;
  Community(
      {required this.name,
      required this.id,
      required this.shortName,
      required this.logo,
      required this.description,
      this.email,
      this.phoneNumber});
  static Community empty() {
    return Community(
        name: "", id: "", shortName: "", logo: "", description: "");
  }

  static List<Community> dummyCommunities = [
    Community(
      name: 'Chin Refugee Community',
      id: '66c592c46bdc2f167fc34ea5',
      shortName: 'CRC',
      logo: 'assets/images/tech_innovators_logo.png',
      description: 'A community of technology enthusiasts and innovators.',
    ),
    Community(
      name: 'Aliance of Chin Refugees',
      id: '66c592c46bdc2f167fc34ea5',
      shortName: 'ACR',
      logo: 'assets/images/green_earth_logo.png',
      description:
          'Dedicated to promoting environmental sustainability and green living.',
    ),
    Community(
      name: 'UN',
      shortName: 'UN',
      id: '66c592c46bdc2f167fc34ea5',
      logo: 'assets/images/health_wellness_logo.png',
      description: 'A group focused on promoting physical and mental health.',
    ),
  ];

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityToJson(this);
}
