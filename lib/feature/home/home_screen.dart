import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/advertisement/presenter/advertisement_item.dart';
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
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    final PageController pageController = PageController();
    final state = ref.watch(homeScreenViewModelProvider);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            shadowColor: null,
            backgroundColor: AppColors.primaryLight,
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
                          icon: const Icon(Icons.notifications, size: 28.0)),
                    ])
              ],
            )),
        // Center is a layout widget. It takes a single child and positions it
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
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      // if (state.advertisements.isNotEmpty)
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.5, // Example height
                          child: ListView.builder(
                            controller: pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.advertisements.length,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemBuilder: (context, index) {
                              return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: AdvertisementItem(
                                    advertisement: state.advertisements[index],
                                    onTap: (advertisement) {
                                      context.push(
                                          AdvertisementDetailScreen.routeName,
                                          extra: advertisement);
                                    },
                                    showSeeMore: true,
                                  ));
                            },
                          )),
                      gapH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                            controller: pageController,
                            count: state.advertisements
                                .length, // Match this with the itemCount
                            effect: WormEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              activeDotColor: AppColors.primary,
                              dotColor: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                      gapH24,

                      if (state.cards.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                            // SizedBox(
                            //     height: MediaQuery.of(context).size.height *
                            //         0.3, // Example height
                            //     child: ListView.builder(
                            //       controller: _pageController,
                            //       scrollDirection: Axis.horizontal,
                            //       itemCount: state.cards.length,
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: 20),
                            //       itemBuilder: (context, index) {
                            //         return Container(
                            //           width: MediaQuery.of(context).size.width *
                            //               0.9,
                            //           child:
                            //         );
                            //       },
                            //     )),

                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CommunityCardItem(
                                  card: state.cards.first,
                                  onTap: (card) {
                                    context.push(CardDetailsScreen.routeName,
                                        extra: card);
                                  },
                                )),
                            // gapH8,
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     SmoothPageIndicator(
                            //       controller: _pageController,
                            //       count: state.cards
                            //           .length, // Match this with the itemCount
                            //       effect: WormEffect(
                            //         dotHeight: 10,
                            //         dotWidth: 10,
                            //         activeDotColor: AppColors.primary,
                            //         dotColor: AppColors.gray,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // gapH16,
                            gapH16,
                          ],
                        ),
                      if (state.notifications.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
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
                        ),
                    ])
              ],
            ),
          ],
        ));
  }
}
