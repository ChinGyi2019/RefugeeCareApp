import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/domain/model/notification/refugee_notification.dart';
import 'package:refugee_care_mobile/feature/notification/presenter/notification_screen.dart';
import 'package:refugee_care_mobile/l10n/app_localizations.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class NotificationItem extends StatelessWidget {
  NotificationItem(
      {super.key,
      required this.notification,
      required this.onTap,
      this.showSeeMore = false});
  RefugeeNotification notification;
  final Function(RefugeeNotification) onTap;
  bool showSeeMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap(notification);
        },
        child: Card(
            elevation: 2,
            color: AppColors.white,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.title,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                      gapH8,
                      Row(
                        children: [
                          Text(notification.createdAt,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12)),
                          gapW8,
                          Text("posed by ${notification.communityShortName}",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12))
                        ],
                      ),
                      gapH8,
                      Text(notification.description,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.titleLight)),
                      gapH16,
                      if (showSeeMore)
                        GestureDetector(
                            onTap: () {
                              context.push(NotificationPage.routeName);
                            },
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('See more'),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14),
                            ))
                    ]))));
  }
}
