import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class RefugeeLoading extends StatelessWidget {
  const RefugeeLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.primary,
    );
  }
}
