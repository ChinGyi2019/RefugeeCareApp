import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/report/report_bottom_sheet_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/save_card_provider.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/widgets/community_card.dart';
import 'package:refugee_care_mobile/l10n/app_localizations.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_dialog.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class CardDetailsScreen extends ConsumerStatefulWidget {
  const CardDetailsScreen({super.key, required this.title, required this.card});
  static const String routeName = '/card-details';
  final String title;
  final CommunityCard card;

  @override
  ConsumerState<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends ConsumerState<CardDetailsScreen> {
  Future<Position?> getCurrentLocation() async {
    LocationPermission permission;
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          debugPrint("Location permissions are denied");
          return null;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // state.lat = position.latitude;
      // state.long = position.longitude;

      return position;
    } catch (e) {
      return null;
    }
  }

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
                    color: AppColors.white,
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
                    color: AppColors.white,
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
                    color: AppColors.white,
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
                              OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (phone.isNotEmpty) {
                                      launchUrl(Uri.parse('tel:$phone'));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Phone number not available')),
                                      );
                                    }
                                  },
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
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primary,
                                                  fontSize: 16))
                                    ],
                                  )),
                              gapW16,
                              OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (email.isNotEmpty) {
                                      launchUrl(Uri.parse('mailto:$email'));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Email address not available')),
                                      );
                                    }
                                  },
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
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primary,
                                                  fontSize: 16))
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              gapH16,
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
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Report to Community",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                            gapH8,
                            Text(
                                AppLocalizations.of(context)!
                                    .translate('report_desc'),
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.titleLight)),
                            gapH16,
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.error,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    builder: (context) {
                                      return ReportBottomSheetScreen(
                                        onSubmit: (officerType, city) async {
                                          // todo api call here
                                          final position =
                                              await getCurrentLocation();
                                          viewModel.report(
                                              officerType, city, position, () {
                                            context.pop();
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return RefugeeDialog(
                                                  singleBtnTitle: "Okay",
                                                  title: ' Report Submitted',
                                                  message:
                                                      'Your report has been successfully submitted.',
                                                  singleBtnCallback: () {},
                                                );
                                              },
                                            );
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Icon(Icons.report),
                                    gapW8,
                                    Text("Report",
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.white,
                                                fontSize: 16))
                                  ],
                                ))
                          ]),
                    ),
                  )),
            ])));
  }
}
