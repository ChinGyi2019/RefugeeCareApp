import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class RefugeeTextButton extends StatelessWidget {
  const RefugeeTextButton(
      {super.key, required this.title, this.isSelected = false, this.onTap});
  final String title;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.textGrey,
                width: isSelected ? 1.5 : 1.0,
              )),
          child: Center(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(title,
                    style: TextStyle(
                        color:
                            isSelected ? AppColors.primary : AppColors.textGrey,
                        fontWeight: FontWeight.w700))),
          )),
    );
  }
}
