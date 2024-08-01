import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/feature/cards/save/save_card_provider.dart';
import 'package:refugee_care_mobile/feature/emergency/animated_emergeny_btn.dart';
import 'package:refugee_care_mobile/feature/emergency/setup/emergency_setup_provider.dart';
import 'package:refugee_care_mobile/feature/emergency/setup/emergency_setup_screen.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key, required this.title});
  static const String routeName = '/card-details';
  final String title;

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmergencySetupProvider>(
      builder: (
        context,
        provider,
        child,
      ) {
        return Column(
          children: [
            AppBar(
              elevation: 0,
              toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
              shadowColor: null,
              centerTitle: false,
              actions: [
                if (provider.state.hasSetup)
                  TextButton(
                      onPressed: () {
                        context.push(EmergencySetupScreen.routeName);
                      },
                      child: Text('Edit',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                  fontSize: 16)))
              ],
              backgroundColor: AppColors.primaryLight,
              title: Text(
                'Emergency',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontSize: 18),
              ),
            ),
            Expanded(
                flex: 1,
                child: AnimatedEmergenyBtn(
                  title: provider.state.hasSetup
                      ? "Double\nclick me"
                      : "Click me\nto Setup",
                  enabled: provider.state.hasSetup,
                  onDoubleTap: () {
                    if (provider.state.hasSetup) provider.sendSMS();
                  },
                  onTap: () {
                    if (!provider.state.hasSetup) {
                      context.push(EmergencySetupScreen.routeName);
                    }
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                          color: AppColors.bgLight, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      elevation: 4,
                      color: AppColors.bgLight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Save your contacts",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14)),
                            gapH8,
                            Text(
                                "Add the phone numbers of your relatives, friends, or trusted contacts (registered in the Refugee Care app) to your emergency contacts. This will ensure you stay closely connected and receive alerts in case of an emergency.",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.titleLight,
                                        fontSize: 12)),
                          ],
                        ),
                      ),
                    )))
          ],
        );
      },
    );
  }
}
