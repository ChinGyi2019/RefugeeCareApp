import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';

class RefugeeTextDropdownField extends StatelessWidget {
  RefugeeTextDropdownField(
      {super.key,
      required this.title,
      this.value = '',
      this.error = "",
      this.onChanged,
      this.decoration,
      this.keyboardType,
      this.validator,
      this.onSaved,
      this.enabled = false,
      this.onTap,
      this.controller});
  final String error;
  final String title;
  final String value;
  final bool enabled;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      gapH16,
      TextFormField(
        controller: controller,
        onTap: onTap,
        enabled: enabled,
        readOnly: true,
        showCursor: false,
        onTapAlwaysCalled: true,
        validator: validator,
        keyboardType: keyboardType,
        decoration: decoration,
        onChanged: onChanged,
        onSaved: onSaved,
      ),
      gapH8,
    ]);
  }
}
