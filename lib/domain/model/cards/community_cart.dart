class CommunityCard {
  String name;
  String id;
  String title;
  String cardNumber;
  String type;
  String dateOfBirth;
  String gender;
  String nationality;
  String dateOfIssue;
  String dateOfExpiry;
  String communityId;
  String passportPhoto;
  String frontSidePhoto;
  String backSidePhoto;
  String? uNHCRNumber;
  String? studentNumber;
  bool isVerified;

  // Constructor with all required fields
  CommunityCard({
    required this.name,
    required this.id,
    required this.cardNumber,
    required this.title,
    required this.type,
    required this.dateOfBirth,
    required this.gender,
    required this.nationality,
    required this.dateOfIssue,
    required this.dateOfExpiry,
    required this.passportPhoto,
    required this.communityId,
    required this.frontSidePhoto,
    required this.backSidePhoto,
    required this.uNHCRNumber,
    required this.studentNumber,
    required this.isVerified,
  });
  static CommunityCard empty() {
    return CommunityCard(
      name: '',
      id: '',
      title: '',
      type: '',
      cardNumber: '',
      dateOfBirth: '',
      gender: '',
      nationality: '',
      dateOfIssue: '',
      dateOfExpiry: '',
      communityId: '',
      passportPhoto: '',
      frontSidePhoto: '',
      backSidePhoto: '',
      uNHCRNumber: '',
      studentNumber: '',
      isVerified: false,
    );
  }

  // Method to convert JSON to CommunityCard object
  factory CommunityCard.fromJson(Map<String, dynamic> json) {
    return CommunityCard(
      name: json['name'],
      id: json['id'],
      cardNumber: json['cardNumber'],
      title: json['title'],
      type: json['type'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
      communityId: json['communityId'],
      nationality: json['nationality'],
      dateOfIssue: json['dateOfIssue'],
      dateOfExpiry: json['dateOfExpiry'],
      passportPhoto: json['passportPhoto'],
      frontSidePhoto: json['frontSidePhoto'],
      backSidePhoto: json['backSidePhoto'],
      uNHCRNumber: json['uNHCRNumber'],
      studentNumber: json['studentNumber'],
      isVerified: json['isVerified'],
    );
  }

  // Method to convert CommunityCard object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'title': title,
      'cardNumber': cardNumber,
      'type': type,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'nationality': nationality,
      'dateOfIssue': dateOfIssue,
      'dateOfExpiry': dateOfExpiry,
      'passportPhoto': passportPhoto,
      'frontSidePhoto': frontSidePhoto,
      'backSidePhoto': backSidePhoto,
      'uNHCRNumber': uNHCRNumber,
      'studentNumber': studentNumber,
      'isVerified': isVerified,
    };
  }
}
