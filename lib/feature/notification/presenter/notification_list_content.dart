import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/model/notification/refugee_notification.dart';
import 'package:refugee_care_mobile/feature/notification/presenter/notification_item.dart';

List<RefugeeNotification> getDummyRefugeeNotifications() {
  return [
    // RefugeeNotification(
    //   date: '2023-01-01',
    //   id: '1',
    //   title: 'UNHCR latest news',
    //   type: 'Food',
    //   description:
    //       'There is an operaci near sungkai besi. Please avoid to go there and  There is an operaci near sungkai besi. Please avoid to go there.',
    //   owner: 'ACR',
    //   dateOfExpiry: '2023-01-10',
    // ),
    // RefugeeNotification(
    //   date: '2023-02-15',
    //   id: '2',
    //   title: 'Medical Camp',
    //   type: 'Health',
    //   description: 'Free medical camp organized by HealthCare NGO.',
    //   owner: 'NGO2',
    //   dateOfExpiry: '2023-02-20',
    // ),
    // RefugeeNotification(
    //   date: '2023-03-10',
    //   id: '3',
    //   title: 'Job Fair',
    //   type: 'Employment',
    //   description: 'Job fair for refugees with various employers.',
    //   owner: 'NGO3',
    //   dateOfExpiry: '2023-03-12',
    // ),
    // RefugeeNotification(
    //   date: '2023-04-05',
    //   id: '4',
    //   title: 'Language Classes',
    //   type: 'Education',
    //   description: 'Language classes for refugees to learn the local language.',
    //   owner: 'NGO4',
    //   dateOfExpiry: '2023-04-30',
    // ),
    // RefugeeNotification(
    //   date: '2023-05-20',
    //   id: '5',
    //   title: 'Clothing Donation',
    //   type: 'Clothing',
    //   description: 'Donation of clothes for refugees at the relief center.',
    //   owner: 'NGO5',
    //   dateOfExpiry: '2023-05-25',
    // ),
    // RefugeeNotification(
    //   date: '2023-06-10',
    //   id: '6',
    //   title: 'Legal Assistance',
    //   type: 'Legal',
    //   description: 'Free legal assistance for refugees.',
    //   owner: 'NGO6',
    //   dateOfExpiry: '2023-06-20',
    // ),
    // RefugeeNotification(
    //   date: '2023-07-15',
    //   id: '7',
    //   title: 'Psychological Support',
    //   type: 'Health',
    //   description: 'Psychological support sessions for refugees.',
    //   owner: 'NGO7',
    //   dateOfExpiry: '2023-07-30',
    // ),
    // RefugeeNotification(
    //   date: '2023-08-01',
    //   id: '8',
    //   title: 'Vocational Training',
    //   type: 'Education',
    //   description: 'Vocational training programs for skill development.',
    //   owner: 'NGO8',
    //   dateOfExpiry: '2023-08-15',
    // ),
    // RefugeeNotification(
    //   date: '2023-09-10',
    //   id: '9',
    //   title: 'Sports Activities',
    //   type: 'Recreation',
    //   description: 'Sports activities organized for children and youth.',
    //   owner: 'NGO9',
    //   dateOfExpiry: '2023-09-20',
    // ),
    // RefugeeNotification(
    //   date: '2023-10-05',
    //   id: '10',
    //   title: 'Health Workshop',
    //   type: 'Health',
    //   description: 'Workshop on health and hygiene practices.',
    //   owner: 'NGO10',
    //   dateOfExpiry: '2023-10-10',
    // ),
  ];
}

class NotificationListContent extends StatelessWidget {
  const NotificationListContent({super.key, required this.notifications});
  final List<RefugeeNotification> notifications;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      shrinkWrap: false,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      itemBuilder: (context, index) {
        final data = notifications[index];
        return NotificationItem(
          notification: data,
          onTap: (notification) {
            // context.push(CardDetailsScreen.routeName, extra: card);
          },
        );
      },
    );
  }
}
