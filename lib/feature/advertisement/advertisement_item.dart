import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/domain/model/directory/directory.dart';
import 'package:refugee_care_mobile/feature/advertisement/advertisement_screen.dart';
import 'package:refugee_care_mobile/l10n/app_localizations.dart';
import 'package:refugee_care_mobile/shared/constants/Default.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class AdvertisementItem extends StatelessWidget {
  AdvertisementItem(
      {super.key,
      required this.advertisement,
      required this.onTap,
      this.showSeeMore = false});
  Advertisement advertisement;
  bool showSeeMore;
  final Function(Advertisement) onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: GestureDetector(
            onTap: () {
              onTap(advertisement);
            },
            child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: AppColors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: Image.asset(
                          'assets/bg/bg_for_promotion.png',
                          height: 100.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(advertisement.title,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16)),
                                gapH8,
                                Row(
                                  children: [
                                    Text(advertisement.date,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12)),
                                    gapW8,
                                    Text("posed by ${advertisement.owner}",
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
                                Text(advertisement.description,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.titleLight)),
                                gapH8,
                                if (showSeeMore)
                                  GestureDetector(
                                      onTap: () {
                                        context.push(
                                            AdvertisementScreen.routeName);
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .translate('See more'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 14),
                                      ))
                              ]))
                    ]))));
  }
}
