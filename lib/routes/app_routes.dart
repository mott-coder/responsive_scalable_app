import 'package:flutter/material.dart';
import '../screens/forgot_password_screen/forgot_password_screen.dart';
import '../screens/main_screen.dart/main_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/privacy_policy_screen/privacy_policy_screen.dart';
import '../screens/register_screen/register_screen.dart';
import '../screens/sign_in_screen/sign_in_screen.dart';
import '../screens/terms_and_conditions_screen/terms_and_conditions_screen.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String signInScreen = '/sign_in_screen';
  static const String registerScreen = 'register_screen';
  static const String mainScreen = '/main_screen';
  static String privacyPolicyScreen = '/privacy_policy_screen';
  static String forgotPasswordScreen = '/forgot_password_screen';
  static String termsAndConditionsScreen = '/terms_and_conditions_screen';

  static Map<String, WidgetBuilder> get routes => {
        initialRoute: (context) => OnboardingScreen(),
        signInScreen: (context) => const SignInScreen(),
        registerScreen: (context) => const RegisterScreen(),
        mainScreen: MainScreen.builder,
        forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
        privacyPolicyScreen: (context) => const PrivacyPolicyScreen(),
        termsAndConditionsScreen: (context) => const TermsAndConditionsScreen(),
      };
}
