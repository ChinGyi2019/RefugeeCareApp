// class RefugeeNotification {
//   String id;
//   String title;
//   String type;
//   String date;
//   String dateOfExpiry;
//   String description;
//   String owner;

//   // Constructor with all required fields
//   RefugeeNotification({
//     required this.date,
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.type,
//     required this.dateOfExpiry,
//     required this.owner,
//   });
//   static RefugeeNotification empty() {
//     return RefugeeNotification(
//       date: '',
//       id: '',
//       title: '',
//       type: '',
//       description: '',
//       owner: '',
//       dateOfExpiry: '',
//     );
//   }

//   // Method to convert JSON to CommunityCard object
//   factory RefugeeNotification.fromJson(Map<String, dynamic> json) {
//     return RefugeeNotification(
//       date: json['date'],
//       description: json['description'],
//       id: json['id'],
//       owner: json['owner'],
//       title: json['title'],
//       type: json['type'],
//       dateOfExpiry: json['dateOfExpiry'],
//     );
//   }

//   // Method to convert CommunityCard object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'type': type,
//       'owner': owner,
//       'date': date,
//       'description': description,
//       'dateOfExpiry': dateOfExpiry,
//     };
//   }
// }
