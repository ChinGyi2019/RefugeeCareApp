import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:refugee_care_mobile/feature/emergency/presenter/provider/emergency_setup_provider.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_form_feild.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_outline_button.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class EmergencySetupScreen extends ConsumerStatefulWidget {
  static const String routeName = '/emergency-setup';
  final String title;
  const EmergencySetupScreen({super.key, required this.title});

  @override
  ConsumerState<EmergencySetupScreen> createState() =>
      _EmergencySetupScreenState();
}

class _EmergencySetupScreenState extends ConsumerState<EmergencySetupScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(emergencyProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(emergencyProvider);

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
                    Navigator.pop(context);
                  },
                )
              : null,
          title: Text(
            'Emergency setup',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontSize: 18),
          ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.bgLight,
            child: ListView(
                shrinkWrap: false,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Select number of contact',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                      )),
                  gapH8,
                  SizedBox(
                      height: 60,
                      child: ListView.builder(
                        itemCount: provider.state.contactNumber,
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: RefugeeTextButton(
                                title: "  ${(index + 1).toString()}  ",
                                onTap: () {
                                  provider.updateSelectedNumber(index);
                                },
                                isSelected:
                                    provider.state.selectedIndex == (index),
                              ));
                        },
                      )),
                  gapH16,
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                          key: provider.state.formKey,
                          child: Column(children: [
                            RefugeeFormFeild(
                              title: 'Leave a message for emergence case',
                              decoration: const InputDecoration(
                                hintText: 'Write a mesage',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Write a mesage';
                                }
                                return null;
                              },
                              value: provider.state.message,
                              onChanged: (value) {
                                provider.updateMessage(value);
                              },
                              onSaved: (value) {
                                provider.updateMessage(value!);
                              },
                            ),
                            gapH16,
                            for (var i = 0;
                                i <= (provider.state.selectedIndex);
                                i++)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contact ${i + 1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.iconBlack,
                                            fontSize: 16),
                                  ),
                                  gapH16,
                                  RefugeeFormFeild(
                                    title:
                                        'Full name (relative, friends, reliable person)',
                                    decoration: const InputDecoration(
                                        hintText: 'Enter full name'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter full name';
                                      }
                                      return null;
                                    },
                                    value: provider.state.contacts[i].name,
                                    onChanged: (value) {
                                      //  provider.updateFullName(value);
                                      // provider.name = value;
                                      provider.updateFullName(i, value);
                                    },
                                    onSaved: (value) {
                                      // provider.updateFullName(value!);
                                      // provider.name = value!;
                                      provider.updateFullName(i, value!);
                                    },
                                  ),
                                  RefugeeFormFeild(
                                    title: "Enter phone number of the person",
                                    decoration: const InputDecoration(
                                        hintText: 'Enter phone number'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter phone number';
                                      }
                                      // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      //     .hasMatch(value)) {
                                      //   return 'Please enter a valid email';
                                      // }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      provider.updatePhoneNumber(i, value);
                                    },
                                    value:
                                        provider.state.contacts[i].phoneNumber,
                                    onSaved: (value) {
                                      provider.updatePhoneNumber(i, value!);
                                    },
                                  ),
                                  gapH16,
                                  if (provider.state.selectedIndex != i)
                                    const Divider(
                                      thickness: 2,
                                      color: AppColors.gray,
                                    ),
                                  gapH16,
                                ],
                              ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: true
                                    ? () {
                                        provider.sumbit(() async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text('Saved success')),
                                          );
                                          context.pop();
                                        });
                                      }
                                    : null,
                                child: const Text('Save'),
                              ),
                            )
                          ])))
                ])));
  }
}

// class SetupScreen extends StatelessWidget {
//   const SetupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return
//   }
// }
