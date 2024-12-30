import 'package:json_annotation/json_annotation.dart';

part 'community_data.g.dart'; // Auto-generated file

@JsonSerializable()
class CommunityData {
  @JsonKey(name: '\$id')
  final String? id;
  final String? name;
  final List<String>? email;
  final String? shortName;
  final String? logoImage;
  final List<String>? phoneNumber;
  final String? description;
  final String? description2;
  final String? description3;
  final bool? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CommunityData({
    this.id,
    this.name,
    this.email,
    this.shortName,
    this.logoImage,
    this.phoneNumber,
    this.description,
    this.description2,
    this.description3,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to generate an instance from JSON
  factory CommunityData.fromJson(Map<String, dynamic> json) =>
      _$CommunityDataFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$CommunityDataToJson(this);
}
