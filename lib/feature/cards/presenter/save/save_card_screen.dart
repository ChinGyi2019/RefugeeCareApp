import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:refugee_care_mobile/shared/widgets/refugee_form_feild.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_outline_button.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_upload_btn.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveCardScreen extends ConsumerStatefulWidget {
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
      final provider = ref.watch(saveCardProvider);
      await provider.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(saveCardProvider);
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
                    if (provider.state.currentScreen == 2) {
                      provider.updateCurrentScreen(1);
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
            width: double.infinity,
            height: double.infinity,
            color: AppColors.bgLight,
            child: Stack(children: [
              if (provider.state.currentScreen == 1)
                const SaveCardStep1Screen()
              else if (provider.state.currentScreen == 2)
                const SaveCardStep2Screen()
            ])));
  }
}

class SaveCardStep1Screen extends ConsumerWidget {
  const SaveCardStep1Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(saveCardProvider);
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
                itemCount: provider.state.communities.length,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                itemBuilder: (context, index) {
                  final data = provider.state.communities[index];
                  return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: RefugeeTextButton(
                        title: data.shortName,
                        onTap: () {
                          provider.updateCommunity(data);
                        },
                        isSelected:
                            provider.state.selectedCommunity.shortName ==
                                data.shortName,
                      ));
                },
              )),
          gapH16,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: provider.state.formKey,
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
                      value: provider.state.card.name,
                      onChanged: (value) {
                        provider.updateFullName(value);
                        // provider.name = value;
                      },
                      onSaved: (value) {
                        provider.updateFullName(value!);
                        // provider.name = value!;
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
                      onChanged: (value) {
                        provider.updateCardNumber(value);
                      },
                      value: provider.state.card.cardNumber,
                      onSaved: (value) {
                        provider.updateCardNumber(value!);
                      },
                    ),
                    RefugeeFormFeild(
                      title: "Date of Birth",
                      decoration: const InputDecoration(
                          hintText: 'Enter your date of birth'),
                      value: provider.state.card.dateOfBirth,
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
                        provider.updateDob(value);
                      },
                      onSaved: (value) {
                        provider.updateDob(value!);
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
                              provider.updateGender("Male");
                            },
                            isSelected: provider.state.card.gender == 'Male'),
                        gapW16,
                        RefugeeTextButton(
                            title: 'Female',
                            onTap: () {
                              provider.updateGender("Female");
                            },
                            isSelected: provider.state.card.gender == 'Female')
                      ],
                    ),
                    gapH16,
                    RefugeeTextDropdownField(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: provider.state.card.nationality)),
                      title: "Nationality",
                      enabled: true,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CountryBottomsheetScreen(
                              selectedCountry: provider.state.card.nationality,
                              onSelect: (country) {
                                provider.updateNationality(country);
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
                        provider.updateNationality(value);
                      },
                      onSaved: (value) {
                        provider.updateNationality(value!);
                      },
                    ),
                    RefugeeFormFeild(
                      title: "Date of issue",
                      value: provider.state.card.dateOfIssue,
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
                        provider.updateDateOfIssue(value);
                      },
                      onSaved: (value) {
                        provider.updateDateOfIssue(value!);
                      },
                    ),
                    gapH20,
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: provider.state.enabledNextButton
                              ? () {
                                  provider.save();
                                  if (provider.validateSetp1()) {}
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
  const SaveCardStep2Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(saveCardProvider);
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
                        imageURL: provider.state.card.passportPhoto,
                        onTap: () {
                          pickImage((file) {
                            provider.updatePasspord(file.path);
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
                                  imageURL: provider.state.card.frontSidePhoto,
                                  onTap: () {
                                    pickImage((file) {
                                      provider.updateFontCard(file.path);
                                    });
                                  }),
                              gapW16,
                              RefugeeUploadBtn(
                                title: "Upload Photo\n(Back)",
                                imageURL: provider.state.card.backSidePhoto,
                                onTap: () {
                                  pickImage((file) {
                                    provider.updateBackCard(file.path);
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: provider.validateSetp2()
                          ? () async {
                              await provider.sumbit(() {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Submitted')),
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

// Text(
//   'Full name (as per your card)',
//   style: Theme.of(context)
//       .textTheme
//       .titleSmall
//       ?.copyWith(fontWeight: FontWeight.bold),
// ),
// gapH16,

// /// EMAIL FIELD
// TextFormField(
//   keyboardType: TextInputType.emailAddress,
//   decoration: const InputDecoration(
//     // suffixIcon: SvgPicture.asset(
//     //   'assets/icons/check_filled.svg',
//     //   width: 17,
//     //   height: 11,
//     //   fit: BoxFit.none,
//     //   colorFilter: AppColors.success.toColorFilter,
//     // ),
//     hintText: 'Enter your full name',
//   ),
// ),
// RefugeeFormFeild(
//   title: "Card's reference no/id (as per your card)",
//   error: 'dd',
//   value: '',
//   validator: (value) {
//     return 'error';
//   },
//   decoration: InputDecoration(hintText: 'Enter card number'),
//   onChanged: (value) {},

// RefugeeFormFeild(
//                             title: 'Full name (as per your card)',
//                             decoration: const InputDecoration(
//                                 hintText: 'Enter your full name'),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your email';
//                               }
//                               if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                                   .hasMatch(value)) {
//                                 return 'Please enter a valid email';
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               provider.email = value!;
//                             },
//                           ),
//                           TextFormField(
//                             decoration: const InputDecoration(labelText: 'Password'),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your password';
//                               }
//                               if (value.length < 6) {
//                                 return 'Password must be at least 6 characters long';
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               provider.password = value!;
//                             },
