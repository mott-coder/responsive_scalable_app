import 'package:flutter/widgets.dart';

import '../../../core/providers/auth_provider.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  AuthProvider authProvider = AuthProvider();
  bool isSendingPasswordResetEmail = false;
  bool hasCompletedSendingPasswordResetEmail = false;
  String? passwordResetEmailSendingError;
  TextEditingController emailInputController = TextEditingController();
  Future<void> resetPassword() async {
    isSendingPasswordResetEmail = true;
    notifyListeners();
    // String? error = await authProvider.sendPasswordResetEmail(
    //   email: emailInputController.text.trim(),
    // );
    // if (error == null) {
    //   isSendingPasswordResetEmail = false;
    //   hasCompletedSendingPasswordResetEmail = true;
    //   notifyListeners();
    // } else {
    //   isSendingPasswordResetEmail = false;
    //   hasCompletedSendingPasswordResetEmail = true;
    //   passwordResetEmailSendingError = error;
    //   notifyListeners();
    // }
  }

  void resetPageData() {
    emailInputController.text = "";
    passwordResetEmailSendingError = null;
    notifyListeners();
  }
}
