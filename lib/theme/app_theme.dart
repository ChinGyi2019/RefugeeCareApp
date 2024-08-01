import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refugee_care_mobile/shared/constants/Default.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:refugee_care_mobile/theme/widget/app_text_form_field_theme.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.bgLight,
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.bgSecondayLight,
        surfaceTintColor: AppColors.bgSecondayLight,
      ),
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primary,
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(
              bodyColor: AppColors.titleLight,
              displayColor: AppColors.titleLight)
          .copyWith(
            bodyLarge: const TextStyle(
              color: AppColors.iconBlack,
              fontWeight: FontWeight.w500,
            ),
            bodyMedium: const TextStyle(
              color: AppColors.iconBlack,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: const TextStyle(
              color: AppColors.textLight,
              fontWeight: FontWeight.w500,
            ),
          ),
      iconTheme: const IconThemeData(color: AppColors.iconLight),
      dividerColor: AppColors.highlightLight,
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: AppColors.highlightLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 56),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDefaults.borderRadius),
            ),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.iconBlack,
        selectedLabelStyle: TextStyle(
            fontSize: 12,
            color: AppColors.primary,
            fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(
            fontSize: 10,
            color: AppColors.iconBlack,
            fontWeight: FontWeight.w700),
        // selectedIconTheme: IconThemeData(color: AppColors.primary)
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary, foregroundColor: AppColors.white),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(100, 56),
          padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding, vertical: AppDefaults.padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
          ),
          side: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
      expansionTileTheme:
          const ExpansionTileThemeData(shape: RoundedRectangleBorder()),
      badgeTheme:
          const BadgeThemeData(backgroundColor: AppColors.error, smallSize: 8),
    );
  }
}
