import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class RefugeeLoading extends StatelessWidget {
  const RefugeeLoading({super.key, this.strokeWidth = 4.0});
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.primary,
      strokeWidth: strokeWidth,
    );
  }
}

class RefugeeLinearLoading extends StatelessWidget {
  const RefugeeLinearLoading({super.key, this.strokeWidth = 2.0});
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: AppColors.primary,
      minHeight: strokeWidth,
    );
  }
}
