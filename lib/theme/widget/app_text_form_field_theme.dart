import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/shared/constants/Default.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class AppTextFormFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.textLight,

    suffixIconColor: AppColors.textLight,
    fillColor: AppColors.bgLight,
    filled: true,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        color: AppColors.titleLight,
        fontFamily: 'GoogleFonts',
        fontWeight: FontWeight.w700),
    hintStyle: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'GoogleFonts',
            fontWeight: FontWeight.w500)
        .copyWith(color: AppColors.textGrey),
    errorStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal,
        fontFamily: 'GoogleFonts',
        fontWeight: FontWeight.w500),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 0.8, color: AppColors.textGrey),
    ),
    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 0.8, color: AppColors.textGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1.5, color: AppColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.textLight,
    suffixIconColor: AppColors.textLight,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(color: AppColors.titleLight),
    hintStyle: const TextStyle().copyWith(color: AppColors.textGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.textLight),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.textLight),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.iconLight),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppDefaults.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );
}
