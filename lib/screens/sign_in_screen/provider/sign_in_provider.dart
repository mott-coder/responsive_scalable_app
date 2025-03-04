import 'package:flutter/material.dart';
import '../models/sign_in_model.dart';

class SignInProvider extends ChangeNotifier {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  SignInModel signInModel = SignInModel();
  bool showPassword = false;
  bool rememberMeCheckbox = false;

  /// Dispose text editing resources
  @override
  void dispose() {
    emailInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  /// Handles remember me check box value changes
  void changeCheckboxValue(bool value) {
    rememberMeCheckbox = value;
    notifyListeners();
  }

  /// Handles password visibility changes
  void changePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
