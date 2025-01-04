import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/advertisement/presenter/advertisement_item.dart';
import 'package:refugee_care_mobile/feature/advertisement/presenter/advertisement_list_content.dart';
import 'package:refugee_care_mobile/feature/advertisement/presenter/detail/advertisement_detail_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/details/card_details_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/widgets/community_card.dart';
import 'package:refugee_care_mobile/feature/home/provider/home_view_model.dart';
import 'package:refugee_care_mobile/feature/notification/presenter/notification_item.dart';
import 'package:refugee_care_mobile/feature/notification/presenter/notification_screen.dart';
import 'package:refugee_care_mobile/feature/profile/profile_screen.dart';
import 'package:refugee_care_mobile/l10n/app_localizations.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(homeScreenViewModelProvider.notifier).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeScreenViewModelProvider);
    return Center(
        // Center is a layout widget. It takes a single child and positions it
        child: Stack(
      children: [
        Container(
            color: AppColors.primaryLight,
            width: double.infinity,
            child: const SizedBox(
              height: 250,
            )),
        ListView(
          children: <Widget>[
            AppBar(
                elevation: 0,
                shadowColor: null,
                backgroundColor: Colors.transparent,
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                context.push(ProfileScreen.routeName);
                              },
                              color: Theme.of(context).primaryColor,
                              icon: const Icon(Icons.person, size: 32.0)),
                          IconButton(
                              onPressed: () {
                                context.push(NotificationPage.routeName);
                              },
                              color: Theme.of(context).primaryColor,
                              icon:
                                  const Icon(Icons.notifications, size: 28.0)),
                        ])
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            AppLocalizations.of(context)!.translate('title'),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22),
                          )),
                      gapH16,
                      if (state.advertisements.isNotEmpty)
                        AdvertisementItem(
                          advertisement: state.advertisements.first,
                          onTap: (advertisement) {
                            context.push(AdvertisementDetailScreen.routeName,
                                extra: advertisement);
                          },
                          showSeeMore: true,
                        ),
                      gapH24,
                      if (state.cards.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "My cards",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary),
                                )),
                            gapH16,
                            CommunityCardItem(
                              card: state.cards.first,
                              onTap: (card) {
                                context.push(CardDetailsScreen.routeName,
                                    extra: card);
                              },
                            ),
                            gapH16,
                          ],
                        ),
                      if (state.notifications.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "Latest news",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary),
                                )),
                            gapH16,
                            NotificationItem(
                              notification: state.notifications.first,
                              onTap: (notification) {},
                              showSeeMore: true,
                            ),
                            gapH16,
                          ],
                        ),
                    ]))
          ],
        ),
      ],
    ));
  }
}
