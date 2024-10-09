String? validatePhoneNumber(String value) {
  // Check if the input is empty
  if (value.isEmpty) {
    return 'Enter a phone number';
  }

  // Remove the country code if it exists (+60 or 60)
  if (value.startsWith('+60')) {
    value = value.substring(3); // Remove +60
  } else if (value.startsWith('60')) {
    value = value.substring(2); // Remove 60
  }

  // Check if the phone number starts with 0
  // if (!value.startsWith('0')) {
  //   return 'Phone number must start with 0';
  // }

  // Remove the leading 0 for easier validation
  value = value.substring(1);

  // Validate the length of the phone number (should be 9 or 10 digits long after removing the leading 0)
  if (value.length < 8 || value.length > 9) {
    return 'Phone number must be 9 or 10 digits long';
  }

  // Validate that the remaining part is numeric
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Phone number should contain only digits';
  }

  return null; // Valid phone number
}
