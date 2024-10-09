import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove any '/' characters before processing
    newText = newText.replaceAll('/', '');

    // Insert '/' at correct positions for MM/DD/YYYY format
    if (newText.length > 2) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }
    if (newText.length > 5) {
      newText = '${newText.substring(0, 5)}/${newText.substring(5)}';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
