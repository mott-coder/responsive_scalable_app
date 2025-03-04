// Validation for Email

import 'package:responsive_scalable_app/core/app_export.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "err_msg_please_enter_an_email".tr;
  }
  final emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  if (!emailRegExp.hasMatch(value)) {
    return "err_msg_please_enter_a_valid_email".tr;
  }
  return null;
}

// Validation for Password
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "err_msg_please_enter_a_password".tr;
  }
  return null;
}

// Validate password strength
String? validatePasswordStrength(String? value) {
  if (value == null || value.isEmpty) {
    return "err_msg_please_enter_a_password".tr;
  }
  const strongPattern =
      r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$';
  final regExp = RegExp(strongPattern);
  if (regExp.hasMatch(value)) {
    return null;
  } else {
    if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
      return "err_msg_at_least_one_uppercase".tr;
    }
    if (!RegExp(r'(?=.*?[a-z])').hasMatch(value)) {
      return "err_msg_at_least_one_lowercase".tr;
    }
    if (!RegExp(r'(?=.*?\d)').hasMatch(value)) {
      return "err_msg_at_least_one_digit".tr;
    }
    if (!RegExp(r'(?=.*?[\W])').hasMatch(value)) {
      return "err_msg_at_least_one_special".tr;
    }
    if (value.contains(" ")) {
      return "err_msg_no_spaces_allowed".tr;
    }
    if (value.length < 8) {
      return "err_msg_password_must_be_atleast_8".tr;
    }
    return "err_msg_password_too_weak".tr;
  }
}

String? validateRepeatPassword(String? password, String? repeatPassword) {
  if (repeatPassword == null || repeatPassword.isEmpty) {
    return "err_msg_please_repeat_your_password".tr;
  } else {
    if (password == repeatPassword) {
      return null;
    } else {
      return "err_msg_passwords_do_not_match".tr;
    }
  }
}

String? validateEmptyField(String value) {
  if (value.isEmpty) return "err_msg_field_is_required".tr;
  return null;
}
