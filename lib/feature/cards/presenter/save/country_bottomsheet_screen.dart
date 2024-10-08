import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

const List<String> dummyCountry = [
  "Myanmar (Chin)",
  "Malaysia",
  "Thailand",
  "Singapore",
  "Rohigya",
  "India",
  "Indonesia"
];

class CountryBottomsheetScreen extends StatelessWidget {
  CountryBottomsheetScreen(
      {super.key, required this.onSelect, this.selectedCountry = ''});
  final Function(String) onSelect;
  String selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          color: AppColors.bgLight,
          border: Border.all(
            color: AppColors.textGrey, // Border color
            width: 0.8, // Border width
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Text(
                  'SelectCountry',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                )),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: dummyCountry.length,
                  itemBuilder: (context, index) {
                    final data = dummyCountry[index];
                    return CountryItem(
                      name: data,
                      isSelected: selectedCountry == data,
                      onTap: () {
                        onSelect(data);
                        context.pop();
                      },
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class CountryItem extends StatelessWidget {
  CountryItem(
      {super.key,
      required this.name,
      required this.isSelected,
      required this.onTap});
  final String name;
  bool isSelected;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.textGrey, // Border color
                width: 1.5, // Border width
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(name))));
  }
}
