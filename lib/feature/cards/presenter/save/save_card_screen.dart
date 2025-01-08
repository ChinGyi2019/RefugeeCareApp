import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/country_bottomsheet_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/save_card_provider.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/extensions/color_extensions.dart';
import 'package:refugee_care_mobile/shared/extensions/date_input_formatter.dart';
import 'package:refugee_care_mobile/shared/extensions/date_validator.dart';
import 'package:refugee_care_mobile/shared/widgets/Refugee_text_dropdown_field.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_dialog.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_form_feild.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_loading.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_outline_button.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_upload_btn.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveCardScreen extends StatefulHookConsumerWidget {
  const SaveCardScreen({super.key, required this.title});
  static const String routeName = '/save-card';
  final String title;

  @override
  ConsumerState<SaveCardScreen> createState() => _SaveCardScreenState();
}

class _SaveCardScreenState extends ConsumerState<SaveCardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = ref.watch(saveCardViewModelProvider.notifier);
      await provider.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(saveCardViewModelProvider);
    final viewModel = ref.watch(saveCardViewModelProvider.notifier);
    ref.listen(
      saveCardViewModelProvider.select((value) => value.error),
      ((previous, next) {
        if (next != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return RefugeeDialog(
                title: next.title,
                message: next.message,
                singleBtnTitle: 'Try again',
                singleBtnCallback: () {
                  context.pop();
                },
              );
            },
          );
        }
      }),
    );
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
                    if (state.currentScreen == 2) {
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
        body: state.currentScreen == 1
            ? SaveCardStep1Screen()
            : SaveCardStep2Screen());
  }
}

class SaveCardStep1Screen extends HookConsumerWidget {
  SaveCardStep1Screen({super.key});
  final formKey = useMemoized(() => GlobalKey<FormState>());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(saveCardViewModelProvider);
    final viewModel = ref.watch(saveCardViewModelProvider.notifier);
    return ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Select card type',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              )),
          gapH8,
          SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: state.communities.length,
                // shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                itemBuilder: (context, index) {
                  final data = state.communities[index];
                  return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: RefugeeTextButton(
                        title: data.shortName,
                        onTap: () {
                          viewModel.updateCommunity(data);
                        },
                        isSelected: state.selectedCommunity?.shortName ==
                            data.shortName,
                      ));
                },
              )),
          gapH16,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RefugeeFormFeild(
                      title: 'Full name (as per your card)',
                      decoration: const InputDecoration(
                          hintText: 'Enter your full name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      value: state.card.name,
                      onChanged: (value) {
                        viewModel.updateFullName(value);
                      },
                    ),
                    RefugeeFormFeild(
                      title: "Card's reference no/id (as per your card)",
                      decoration: const InputDecoration(
                          hintText: 'Enter your card number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your card no';
                        }
                        // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        //     .hasMatch(value)) {
                        //   return 'Please enter a valid email';
                        // }
                        return null;
                      },
                      value: state.card.cardNumber,
                      onChanged: (value) {
                        viewModel.updateCardNumber(value);
                      },
                    ),
                    RefugeeFormFeild(
                      title: "Date of Birth",
                      decoration: const InputDecoration(
                          hintText: 'Enter your date of birth'),
                      value: state.card.dateOfBirth,
                      validator: (value) {
                        return validateDate(value ?? '');
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(
                            10), // Limit length to 10 (MM/DD/YYYY)
                        DateInputFormatter(),
                      ],
                      onChanged: (value) {
                        viewModel.updateDob(value);
                      },
                      onSaved: (value) {
                        viewModel.updateDob(value!);
                      },
                    ),
                    gapH16,
                    Text("Select Gender",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    gapH16,
                    Row(
                      children: [
                        RefugeeTextButton(
                            title: 'Male',
                            onTap: () {
                              viewModel.updateGender("Male");
                            },
                            isSelected: state.card.gender == 'Male'),
                        gapW16,
                        RefugeeTextButton(
                            title: 'Female',
                            onTap: () {
                              viewModel.updateGender("Female");
                            },
                            isSelected: state.card.gender == 'Female')
                      ],
                    ),
                    gapH16,
                    RefugeeTextDropdownField(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(text: state.card.nationality)),
                      title: "Nationality",
                      enabled: true,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CountryBottomsheetScreen(
                              selectedCountry: state.card.nationality ?? '',
                              countries: dummyCountry,
                              onSelect: (country) {
                                viewModel.updateNationality(country);
                              },
                            );
                          },
                        );
                      },
                      // value: provider.state.card.nationality,
                      decoration: InputDecoration(
                        hintText: 'Enter your nationality',
                        suffixIcon: SvgPicture.asset(
                          'assets/icons/chevron_down_filled.svg',
                          width: 17,
                          height: 11,
                          fit: BoxFit.none,
                          colorFilter: AppColors.primary.toColorFilter,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your nationality';
                        }
                        // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        //     .hasMatch(value)) {
                        //   return 'Please enter a valid email';
                        // }
                        return null;
                      },
                      onChanged: (value) {
                        viewModel.updateNationality(value);
                      },
                      onSaved: (value) {
                        viewModel.updateNationality(value!);
                      },
                    ),
                    RefugeeFormFeild(
                      title: "Date of issue",
                      value: state.card.dateOfIssue ?? '',
                      decoration: const InputDecoration(
                          hintText: 'Enter your date of issue'),
                      validator: (value) {
                        return validateDate(value ?? '');
                        // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        //     .hasMatch(value)) {
                        //   return 'Please enter a valid email';
                        // }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(
                            10), // Limit length to 10 (MM/DD/YYYY)
                        DateInputFormatter(),
                      ],
                      onChanged: (value) {
                        viewModel.updateDateOfIssue(value);
                      },
                      onSaved: (value) {
                        viewModel.updateDateOfIssue(value!);
                      },
                    ),
                    gapH20,
                    state.loading
                        ? const Align(
                            alignment: Alignment.center,
                            child: RefugeeLoading(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: state.enabledNextButton
                                    ? () {
                                        formKey.currentState?.save();
                                        if (formKey.currentState?.validate() ==
                                            true) {
                                          viewModel.updateCurrentScreen(2);
                                        }
                                      }
                                    : null,
                                child: const Text('Next'),
                              ),
                            ),
                          ),
                  ],
                ),
              )),
        ]);
  }
}

class SaveCardStep2Screen extends ConsumerWidget {
  SaveCardStep2Screen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(saveCardViewModelProvider);
    final viewModel = ref.watch(saveCardViewModelProvider.notifier);
    Future<void> pickImage(Function(XFile) onDone) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        onDone(pickedFile);
      }
    }

    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapH16,
                      Text("Upload copy of your passport size  photo",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w500)),
                      gapH16,
                      RefugeeUploadBtn(
                        title: "Upload Photo",
                        imageURL: state.card.passportPhoto,
                        onTap: () {
                          pickImage((file) {
                            viewModel.updatePassport(file.path);
                          });
                        },
                      ),
                      gapH16,
                      Text("Upload your proof of card (front/back)",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w500)),
                      gapH16,
                      SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: ListView(
                            shrinkWrap: false,
                            scrollDirection: Axis.horizontal,
                            children: [
                              RefugeeUploadBtn(
                                  title: "Upload Photo\n(Back)",
                                  imageURL: state.card.frontSidePhoto,
                                  onTap: () {
                                    pickImage((file) {
                                      viewModel.updateFrontCard(file.path);
                                    });
                                  }),
                              gapW16,
                              RefugeeUploadBtn(
                                title: "Upload Photo\n(Back)",
                                imageURL: state.card.backSidePhoto,
                                onTap: () {
                                  pickImage((file) {
                                    viewModel.updateBackCard(file.path);
                                  });
                                },
                              ),
                            ],
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
                            color: AppColors.bgLight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Note",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16)),
                                  gapH8,
                                  Text(
                                      "A community officer will review your information. Once your card is verified, its status will be shown as 'verified’.",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  gapH24,
                  gapH24,
                  state.loading
                      ? const Align(
                          alignment: Alignment.center,
                          child: RefugeeLoading(),
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: viewModel.validateStep2()
                                ? () async {
                                    await viewModel.submit(() {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Submitted')),
                                      );
                                      context.pop();
                                    });
                                  }
                                : null,
                            child: const Text('Next'),
                          ),
                        )
                ])));
  }
}
