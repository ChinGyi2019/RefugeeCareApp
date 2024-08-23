import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class RefugeeFormFeild extends StatelessWidget {
  const RefugeeFormFeild(
      {super.key,
      required this.title,
      this.value = '',
      this.error = "",
      this.onChanged,
      this.decoration,
      this.keyboardType,
      this.validator,
      this.onSaved,
      this.obscureText = false,
      this.enabled = true});
  final String error;
  final String title;
  final String value;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
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
          obscureText: obscureText,
          initialValue: value,
          enabled: enabled,
          validator: validator,
          keyboardType: keyboardType,
          decoration: decoration,
          onChanged: onChanged,
          onSaved: onSaved),
      gapH8,
    ]);
  }
}
