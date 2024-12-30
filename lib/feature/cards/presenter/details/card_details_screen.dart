import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/save_card_provider.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/widgets/community_card.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class CardDetailsScreen extends ConsumerStatefulWidget {
  const CardDetailsScreen({super.key, required this.title, required this.card});
  static const String routeName = '/card-details';
  final String title;
  final CommunityCard card;

  @override
  ConsumerState<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends ConsumerState<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(saveCardViewModelProvider);
    final viewModel = ref.watch(saveCardViewModelProvider.notifier);
    final email = widget.card.community.email?.firstOrNull ?? '';
    final phone = widget.card.community.phoneNumber?.firstOrNull ?? '';
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
          shadowColor: null,
          centerTitle: false,
          backgroundColor: AppColors.primaryLight,
          leading: context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.chevron_left_sharp),
                  color: AppColors.primary,
                  iconSize: 32, // Customize your icon here
                  onPressed: () {
                    if (provider.currentScreen == 2) {
                      viewModel.updateCurrentScreen(1);
                      return;
                    }
                    Navigator.pop(context);
                  },
                )
              : null,
          title: Text(
            'Save your card',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontSize: 18),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [
              CommunityCardItem(card: widget.card, onTap: (card) {}),
              SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: AppColors.textGrey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    elevation: 0,
                    color: AppColors.bgLight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Registered with UNHCR",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                          gapH8,
                          Text(widget.card.community.description,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.titleLight)),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: AppColors.textGrey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    elevation: 0,
                    color: AppColors.bgLight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Verified by ${widget.card.community.name}",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                          gapH8,
                          Text(widget.card.community.description2 ?? '',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.titleLight)),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: AppColors.textGrey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    elevation: 0,
                    color: AppColors.bgLight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact Us",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                          gapH8,
                          Text(widget.card.community.description3 ?? '',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.titleLight)),
                          gapH16,
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      const Icon(Icons.phone),
                                      gapW8,
                                      Text("Call",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white,
                                                  fontSize: 16))
                                    ],
                                  )),
                              gapW16,
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      const Icon(Icons.email_outlined),
                                      gapW8,
                                      Text("Email",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white,
                                                  fontSize: 16))
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ])));
  }
}
