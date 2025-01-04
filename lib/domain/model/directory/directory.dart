import 'package:freezed_annotation/freezed_annotation.dart';

part 'directory.freezed.dart';
part 'directory.g.dart';

@freezed
class Directory with _$Directory {
  const factory Directory({
    @Default('') String name,
    @Default('') String job,
    @Default('') String id,
    @Default([]) List<String> image,
    @Default([]) List<String> tag,
    required String description,
    @Default([]) List<String> phone,
    @Default([]) List<String> email,
  }) = _Directory;

  factory Directory.fromJson(Map<String, dynamic> json) =>
      _$DirectoryFromJson(json);
}

// part 'directory.g.dart';

// @JsonSerializable()
// class Directory {
//   final String name;
//   final String job;
//   final String id;
//   final List<String> image;
//   final List<String> tag;
//   final String description;
//   final List<String> phone;
//   final String email;
//   Directory(
//       {required this.name,
//       required this.id,
//       required this.job,
//       required this.image,
//       required this.tag,
//       required this.description,
//       required this.email,
//       required this.phone});

//   static List<Directory> dummyCommunities = [
//     // Directory(
//     //   name: 'Chin Refugee Community',
//     //   id: '001',
//     //   shortName: 'CRC',
//     //   logo: 'assets/images/tech_innovators_logo.png',
//     //   description: 'A community of technology enthusiasts and innovators.',
//     // ),
//     // Directory(
//     //   name: 'Aliance of Chin Refugees',
//     //   id: '002',
//     //   shortName: 'ACR',
//     //   logo: 'assets/images/green_earth_logo.png',
//     //   description:
//     //       'Dedicated to promoting environmental sustainability and green living.',
//     // ),
//     // Directory(
//     //   name: 'UN',
//     //   shortName: 'UN',
//     //   id: '003',
//     //   logo: 'assets/images/health_wellness_logo.png',
//     //   description: 'A group focused on promoting physical and mental health.',
//     // ),
//   ];

//   factory Directory.fromJson(Map<String, dynamic> json) =>
//       _$DirectoryFromJson(json);

//   Map<String, dynamic> toJson() => _$DirectoryToJson(this);
// }
