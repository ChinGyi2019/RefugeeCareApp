import 'package:json_annotation/json_annotation.dart';
part 'directory_data.g.dart';

@JsonSerializable()
class DirectoryData {
  final String? name;
  final String? job;
  final String? id;
  final List<String>? image;
  final List<String>? tag;
  final String? description;
  final List<String>? phone;
  final List<String>? email;
  DirectoryData(
      {this.name,
      this.id,
      this.job,
      this.image,
      this.tag,
      this.description,
      this.email,
      this.phone});

  factory DirectoryData.fromJson(Map<String, dynamic> json) =>
      _$DirectoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$DirectoryDataToJson(this);
}
