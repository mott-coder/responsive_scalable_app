import 'package:flutter/material.dart';

import '../models/register_model.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterModel registerModel = RegisterModel();
  TextEditingController fullNameInputController = TextEditingController();
  TextEditingController emailAddressInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController repeatPasswordInputController = TextEditingController();

  bool acceptTnCAndDataPolicy = false;
  bool showPassword = false;
  bool showRepeatPassword = false;

  /// Dispose text editing resources
  @override
  void dispose() {
    fullNameInputController.dispose();
    emailAddressInputController.dispose();
    passwordInputController.dispose();
    repeatPasswordInputController.dispose();
    super.dispose();
  }

  /// Handles terns and conditions and data policy check box value changes
  void changeCheckboxValue(bool value) {
    acceptTnCAndDataPolicy = value;
    notifyListeners();
  }

  /// Handles password fields visibility
  void changePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void changeRepeatPasswordVisibility() {
    showRepeatPassword = !showRepeatPassword;
    notifyListeners();
  }
}
