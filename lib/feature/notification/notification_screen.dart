import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/feature/cards/list/card_list.dart';
import 'package:refugee_care_mobile/feature/cards/community_card.dart';
import 'package:refugee_care_mobile/feature/notification/notification_list_content.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key, required this.title});
  static const String routeName = "/notification";

  final String title;

  @override
  State<NotificationPage> createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.bgLight,
        child: Column(children: [
          AppBar(
            elevation: 0,
            toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
            shadowColor: null,
            centerTitle: false,
            backgroundColor: AppColors.primaryLight,
            title: Text(
              'Notification',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 18),
            ),
            leading: context.canPop()
                ? IconButton(
                    icon: const Icon(Icons.chevron_left_sharp),
                    color: AppColors.primary,
                    iconSize: 32, // Customize your icon here
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                : null,
          ),
          Expanded(child: NotificationListContent())
        ]));
  }
}
