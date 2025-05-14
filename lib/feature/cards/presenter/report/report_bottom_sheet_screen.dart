import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/country_bottomsheet_screen.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/extensions/color_extensions.dart';
import 'package:refugee_care_mobile/shared/widgets/Refugee_text_dropdown_field.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_outline_button.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class ReportBottomSheetScreen extends HookConsumerWidget {
  final List<String> officers = ['Police', 'Immigration', 'CID'];
  Function(String, String) onSubmit;
  ReportBottomSheetScreen({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOfficer = useState('');
    final selectedCity = useState('');
    final errorOfficer = useState('');
    final errorCity = useState('');

    void validateAndSubmit() {
      var isValid = true;
      if (selectedCity.value.isEmpty) {
        errorCity.value = "Please select city or state";
        isValid = false;
      }
      if (selectedOfficer.value.isEmpty) {
        errorOfficer.value = "Please select type";
        isValid = false;
      }
      if (isValid) {
        onSubmit(selectedOfficer.value, selectedCity.value);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Reporting Details",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      context.pop();
                    },
                  )
                ],
              ),
              gapH20,
              Text("Please let us know who arrested you?",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
              gapH8,
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: officers.length,
                  itemBuilder: (context, index) {
                    final item = officers[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        height: 60,
                        child: RefugeeTextButton(
                          title: item,
                          isSelected: selectedOfficer.value == item,
                          onTap: () {
                            errorOfficer.value = '';
                            selectedOfficer.value = item;
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              gapH4,
              if (errorOfficer.value.isNotEmpty)
                Text(errorOfficer.value,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.error,
                        fontSize: 14)),
              gapH16,
              RefugeeTextDropdownField(
                // controller: stateTextController,
                controller: TextEditingController.fromValue(
                    TextEditingValue(text: selectedCity.value)),
                title: "Select Arrest Location: City or State (optional)",
                enabled: true,

                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 1,
                        child: CountryBottomsheetScreen(
                          countries: malaysiaStateNCity,
                          selectedCountry: selectedCity.value,
                          onSelect: (city) {
                            selectedCity.value = city;
                            errorCity.value = "";
                          },
                        ),
                      );
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Select state or city',
                  suffixIcon: SvgPicture.asset(
                    'assets/icons/chevron_down_filled.svg',
                    width: 17,
                    height: 11,
                    fit: BoxFit.none,
                    colorFilter: AppColors.primary.toColorFilter,
                  ),
                ),
                onChanged: (value) {
                  selectedCity.value = value;
                  errorCity.value = "";
                },
              ),
              //if (errorCity.value.isNotEmpty)
              Text(errorCity.value,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.error,
                      fontSize: 14)),
              gapH24,
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  validateAndSubmit();
                  context.pop();
                },
                child: Text("Submit",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        fontSize: 16))),
          ),
        ],
      ),
    );
  }
}
