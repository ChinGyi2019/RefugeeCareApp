import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/model/directory/directory.dart';
import 'package:refugee_care_mobile/feature/directory/presenter/directory_card.dart';

List<Directory> getDummyDirectories() {
  return [
    // Directory(
    //   name: 'Salai Jasmes',
    //   id: '1',
    //   job: 'ACR chairman',
    //   image:
    //       "https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression",
    //   tag: ['Health', 'Emergency'],
    //   description: 'A dedicated doctor with over 10 years of experience.',
    //   email: 'john.doe@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'Jane Smith',
    //   id: '2',
    //   job: 'Lawyer',
    //   image: '',
    //   tag: ['Legal', 'Assistance'],
    //   description: 'Experienced lawyer specializing in refugee cases.',
    //   email: 'jane.smith@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'Michael Johnson',
    //   id: '3',
    //   job: 'Teacher',
    //   image: '',
    //   tag: ['Education', 'Training'],
    //   description: 'Passionate teacher helping refugees learn new skills.',
    //   email: 'michael.johnson@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'Emily Davis',
    //   id: '4',
    //   job: 'Psychologist',
    //   image:
    //       'https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression',
    //   tag: ['Health', 'Mental Support'],
    //   description: 'Providing mental health support to refugees.',
    //   email: 'emily.davis@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'David Wilson',
    //   id: '5',
    //   job: 'Engineer',
    //   image: '',
    //   tag: ['Infrastructure', 'Development'],
    //   description: 'Helping build and maintain essential infrastructure.',
    //   email: 'david.wilson@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'Sophia Martinez',
    //   id: '6',
    //   job: 'Nurse',
    //   image: '',
    //   tag: ['Health', 'Emergency'],
    //   description: 'Caring nurse providing medical assistance.',
    //   email: 'sophia.martinez@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'James Brown',
    //   id: '7',
    //   job: 'Social Worker',
    //   image:
    //       'https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression',
    //   tag: ['Social Services', 'Support'],
    //   description: 'Dedicated social worker assisting refugees.',
    //   email: 'james.brown@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'Olivia Garcia',
    //   id: '8',
    //   job: 'Volunteer Coordinator',
    //   image: '',
    //   tag: ['Coordination', 'Management'],
    //   description: 'Coordinating volunteer efforts and activities.',
    //   email: 'olivia.garcia@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'William Rodriguez',
    //   id: '9',
    //   job: 'Translator',
    //   image: '',
    //   tag: ['Language', 'Support'],
    //   description: 'Providing translation services for refugees.',
    //   email: 'william.rodriguez@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
    // Directory(
    //   name: 'Isabella Hernandez',
    //   id: '10',
    //   job: 'Chef',
    //   image: '',
    //   tag: ['Food', 'Nutrition'],
    //   description: 'Chef preparing meals for refugees.',
    //   email: 'isabella.hernandez@example.com',
    //   phone: ['+1234567890', '+0987654321'],
    // ),
  ];
}

class DirectoryListContent extends StatelessWidget {
  DirectoryListContent({super.key, required this.directories});
  List<Directory> directories;

  // Sample data for the refugee cards

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: directories.length,
      shrinkWrap: false,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      itemBuilder: (context, index) {
        final data = directories[index];
        return DirectoryCard(
          directory: data,
          onTap: (card) {
            // context.push(CardDetailsScreen.routeName, extra: card);
          },
        );
      },
    );
  }
}
