import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/feature/advertisement/advertisement_item.dart';
import 'package:refugee_care_mobile/feature/advertisement/advertisement_list_content.dart';
import 'package:refugee_care_mobile/feature/advertisement/detail/advertisement_detail_screen.dart';
import 'package:refugee_care_mobile/feature/start/start_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/details/card_details_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/list/card_list.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/widgets/community_card.dart';
import 'package:refugee_care_mobile/feature/entry_point/entry_point.dart';
import 'package:refugee_care_mobile/feature/notification/notification_item.dart';
import 'package:refugee_care_mobile/feature/notification/notification_list_content.dart';
import 'package:refugee_care_mobile/feature/notification/notification_screen.dart';
import 'package:refugee_care_mobile/l10n/app_localizations.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.title});
  static const String routeName = "/profile";

  final String title;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            shadowColor: null,
            backgroundColor: AppColors.primaryLight,
            leading: Container(),
            title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {
                    context.go(EntryPoint.routeName);
                  },
                  color: Theme.of(context).primaryColor,
                  icon: const Icon(
                    Icons.close,
                    size: 32.0,
                  )),
            ])),
        body: Stack(
          children: [
            Container(
                color: AppColors.primaryLight,
                width: double.infinity,
                child: const SizedBox(
                  height: 250,
                )),
            ListView(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      "Hi, Van Za",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 24),
                                    )),
                                gapH16,
                                Card(
                                  elevation: 4,
                                  color: AppColors.bgLight,
                                  child: Column(
                                    children: [
                                      PofileCardItem(
                                        icon: Icons.edit,
                                        title: "Edit profile",
                                        onTap: () {},
                                      ),
                                      PofileCardItem(
                                        icon: Icons.key,
                                        title: "Change password",
                                        onTap: () {},
                                      ),
                                      PofileCardItem(
                                        icon: Icons.language,
                                        title: "Change Language",
                                        onTap: () {},
                                      ),
                                      PofileCardItem(
                                        icon: Icons.credit_card,
                                        title: "Manage community card",
                                        onTap: () {},
                                      ),
                                      PofileCardItem(
                                        icon: Icons.add_alert_outlined,
                                        title: "Police reporting option",
                                        onTap: () {},
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        ]))
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "v-1.0.0",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    gapH16,
                    OutlinedButton(
                      onPressed: () {
                        context.go(StartScreen.routeName);
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Logout'),
                    ),
                    gapH32,
                    gapH24
                  ],
                ))
          ],
        ));
  }
}

class PofileCardItem extends StatelessWidget {
  PofileCardItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});
  String title;
  IconData icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    icon: Icon(
                      icon,
                      size: 32.0,
                    )),
                gapW8,
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                )
              ],
            )));
  }
}
