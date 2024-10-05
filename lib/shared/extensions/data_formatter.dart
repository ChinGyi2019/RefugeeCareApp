import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(String dateStr) {
  try {
    final DateFormat inputFormat = DateFormat('MM/dd/yyyy');
    final DateFormat outputFormat =
        DateFormat('yyyy-MM-ddTHH:mm:ssZ'); // Adjust if needed

    DateTime dateTime = inputFormat.parse(dateStr);
    return outputFormat.format(dateTime);
  } catch (exception) {
    debugPrint(exception.toString());
    return dateStr;
  }
}
