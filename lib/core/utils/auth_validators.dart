import 'package:appointment_app/core/classes/utils/app_snackbar.dart';
import 'package:country_picker/src/country.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validators {
  // AUTH VALIDATORS

  ///Email validator

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  /// Password Validator

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return 'Password must contain letters';
    }
    return null;
  }

  /// Confirm Password Validator
  static String? validateConfirmPassword(
      String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // PROFILE VALIDATORS

  /// Full Name Validator

  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim())) {
      return 'Name can only contain letters';
    }
    return null;
  }

  /// Username Validator

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your username';
    }
    if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value.trim())) {
      return 'Username can only contain letters, numbers, and underscore';
    }
    return null;
  }

  /// Birthdate Validator

  static String? validateBirthdate(DateTime? date) {
    if (date == null) {
      return 'Please select your birthdate';
    }

    if (date.isAfter(DateTime.now())) {
      return 'Birthdate cannot be in the future';
    }

    final age = DateTime.now().year - date.year;
    if (age < 0 || age > 120) {
      return 'Enter a valid age';
    }

    return null;
  }

  /// Phone Validator
  static String? validatePhone(String? value, Rx<Country> selectedCountry) {
    if (value == null || value.trim().isEmpty) {
      AppSnackBar.error('Please enter your phone number');
      return 'Please enter your phone number';
    }

    String phone = value.trim();
    phone = phone.replaceAll(' ', '');

    final countryCode = '${selectedCountry.value.phoneCode}';
    if (phone.startsWith('+')) phone = phone.substring(1);

    if (!phone.startsWith(countryCode)) {
      AppSnackBar.error('Phone number must start with +$countryCode');
      return 'Phone number must start with +$countryCode';
    }

    final numberWithoutCode = phone.substring(countryCode.length);

    if (numberWithoutCode.length < 8) {
      AppSnackBar.error('Enter a valid phone number');
      return 'Enter a valid phone number';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(numberWithoutCode)) {
      AppSnackBar.error('Phone number can only contain digits');
      return 'Phone number can only contain digits';
    }

    return null;
  }
}
