String? validateDate(String value) {
  // Check if the input has the correct length for a date MM/DD/YYYY
  if (value.isEmpty || value.length != 10) {
    return 'Enter a valid date in DD/MM/YYYY format';
  }

  // Split the date into components
  List<String> dateParts = value.split('/');
  if (dateParts.length != 3) {
    return 'Invalid date format';
  }

  // Parse the components into integers
  int month = int.tryParse(dateParts[1]) ?? -1;
  int day = int.tryParse(dateParts[0]) ?? -1;
  int year = int.tryParse(dateParts[2]) ?? -1;

  // Validate month
  if (month < 1 || month > 12) {
    return 'Enter a valid month (01-12)';
  }

  // Validate day based on month (basic validation, not leap year aware)
  if (day < 1 || day > 31) {
    return 'Enter a valid day (01-31)';
  }

  if (month == 2 && day > 29) {
    return 'February only has 28 or 29 days';
  }
  if ([4, 6, 9, 11].contains(month) && day > 30) {
    return 'This month has only 30 days';
  }

  // Validate year (simple check for reasonable years)
  if (year < 1900 || year > DateTime.now().year) {
    return 'Enter a valid year';
  }

  return null; // Valid input
}
