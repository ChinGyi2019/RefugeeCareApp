import 'package:json_annotation/json_annotation.dart';

part 'community.g.dart';

@JsonSerializable()
class Community {
  final String name;
  final String shortName;
  final String id;
  final String logo;
  final String description;
  Community(
      {required this.name,
      required this.id,
      required this.shortName,
      required this.logo,
      required this.description});

  static List<Community> dummyCommunities = [
    Community(
      name: 'Chin Refugee Community',
      id: '001',
      shortName: 'CRC',
      logo: 'assets/images/tech_innovators_logo.png',
      description: 'A community of technology enthusiasts and innovators.',
    ),
    Community(
      name: 'Aliance of Chin Refugees',
      id: '002',
      shortName: 'ACR',
      logo: 'assets/images/green_earth_logo.png',
      description:
          'Dedicated to promoting environmental sustainability and green living.',
    ),
    Community(
      name: 'UN',
      shortName: 'UN',
      id: '003',
      logo: 'assets/images/health_wellness_logo.png',
      description: 'A group focused on promoting physical and mental health.',
    ),
  ];

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityToJson(this);
}
