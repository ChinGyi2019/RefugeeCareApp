import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/notification/presenter/notification_list_content.dart';
import 'package:refugee_care_mobile/feature/notification/presenter/provider/notification_view_model.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_loading.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class NotificationPage extends StatefulHookConsumerWidget {
  const NotificationPage({super.key, required this.title});
  static const String routeName = "/notification";

  final String title;

  @override
  ConsumerState<NotificationPage> createState() => NotificationPageState();
}

class NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationViewModelProvider);
    final viewModel = ref.watch(notificationViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
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
      body: state.when(
          data: (notifications) {
            return Column(children: [
              if (notifications.isEmpty)
                Expanded(
                  child: Center(
                    child: Text("No notifications"),
                  ),
                ),
              Expanded(
                  child: NotificationListContent(
                notifications: notifications,
              ))
            ]);
          },
          loading: () => const RefugeeLinearLoading(),
          error: (error, _) => Center(
                child: Text(error.toString()),
              )),
    );
  }
}
