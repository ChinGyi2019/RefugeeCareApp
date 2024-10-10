import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';

class RefugeeFormFeild extends StatelessWidget {
  RefugeeFormFeild(
      {super.key,
      required this.title,
      this.value = '',
      this.error = "",
      this.onChanged,
      this.decoration,
      this.keyboardType,
      this.validator,
      this.onSaved,
      this.controller,
      this.inputFormatters,
      this.obscureText = false,
      this.enabled = true});
  final String error;
  final String title;
  final String value;
  final bool enabled;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  List<TextInputFormatter>? inputFormatters;
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
      if (controller != null)
        TextFormField(
            obscureText: obscureText,
            enabled: enabled,
            validator: validator,
            controller: controller,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            decoration: decoration,
            onChanged: onChanged,
            onSaved: onSaved)
      else
        TextFormField(
            obscureText: obscureText,
            initialValue: value,
            enabled: enabled,
            validator: validator,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            decoration: decoration,
            onChanged: onChanged,
            onSaved: onSaved),
      gapH8,
    ]);
  }
}
