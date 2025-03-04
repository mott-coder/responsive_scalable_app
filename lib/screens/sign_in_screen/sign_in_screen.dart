import 'dart:io';

import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'provider/sign_in_provider.dart';

import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray10001,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsetsDirectional.only(
              start: 20.h,
              // top: 64.h,
              end: 20.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 32.h,
                            vertical: 30.h,
                          ),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.onPrimary,
                                  spreadRadius: 2.h,
                                  blurRadius: 2.h,
                                  offset: const Offset(0, 4),
                                )
                              ]),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "msg_welcome_home".tr,
                                style: CustomTextStyles.bodyMediumBlack900,
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Text(
                                "msg_sign_in_to_your".tr,
                                style: theme.textTheme.headlineSmall,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildEmailInput(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildPasswordInput(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildRememberMeCheckbox(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildForgotPasswordButton(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildSignInButton(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildOrDivider(context),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              _buildLoginWithGoogleButton(context),
                              SizedBox(
                                height: 16.h,
                              ),
                              Platform.isIOS
                                  ? _buildLoginWithAppleButton(context)
                                  : const SizedBox.shrink(),
                              Platform.isIOS
                                  ? SizedBox(
                                      height: 16.h,
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "msg_dont_have_an_account".tr,
                                    style: CustomTextStyles.bodyMediumGray900,
                                  ),
                                  SizedBox(
                                    width: 4.h,
                                  ),
                                  InkResponse(
                                    onTapUp: (details) {
                                      NavigatorService.popAndPushNamed(
                                          AppRoutes.registerScreen);
                                    },
                                    child: Text(
                                      "lbl_create_an_account".tr,
                                      style: CustomTextStyles.titleSmallBold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return Selector<SignInProvider, TextEditingController?>(
      selector: (context, provider) => provider.emailInputController,
      builder: (context, emailInputController, child) {
        return CustomTextFormField(
          controller: emailInputController,
          hintText: "msg_email_address".tr,
          textInputType: TextInputType.emailAddress,
          prefix: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.h, vertical: 10.h),
              child: Icon(Icons.mail)),
          prefixConstraints: BoxConstraints(
            maxHeight: 44.h,
          ),
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.h,
            vertical: 10.h,
          ),
          validator: (value) {
            return validateEmail(value);
          },
          autofocus: false,
          obscureText: false,
          readOnly: false,
        );
      },
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, provider, child) {
        return CustomTextFormField(
          controller: provider.passwordInputController,
          hintText: "msg_password".tr,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          prefix: InkResponse(
            onTapUp: (details) {
              provider.changePasswordVisibility();
            },
            child: Container(
                margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.h,
                  vertical: 10.h,
                ),
                child: Icon(provider.showPassword
                    ? Icons.visibility
                    : Icons.visibility_rounded)),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 44.h,
          ),
          obscureText: !provider.showPassword,
          autofocus: false,
          readOnly: false,
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.h,
            vertical: 10.h,
          ),
          validator: (value) {
            return validatePassword(value);
          },
        );
      },
    );
  }

  Widget _buildRememberMeCheckbox(BuildContext context) {
    return Selector<SignInProvider, bool?>(
      selector: (context, provider) => provider.rememberMeCheckbox,
      builder: (context, rememberMeCheckbox, child) {
        return CustomCheckboxButton(
          text: "lbl_remember_me".tr,
          value: rememberMeCheckbox ?? false,
          onChange: (value) {
            context.read<SignInProvider>().changeCheckboxValue(value);
          },
        );
      },
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, signInProvider, child) {
        return CustomElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              AppLogger.debug("Form is valid");
              NavigatorService.pushNamedAndRemoveUntil(AppRoutes.mainScreen);
            } else {
              AppLogger.debug("Form is not valid");
            }
          },
          text: "lbl_sign_in".tr,
        );
      },
    );
  }

  Widget _buildOrDivider(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              thickness: 2.h,
              color: appTheme.gray300,
            ),
          ),
          SizedBox(
            width: 12.h,
          ),
          Text(
            "msg_or".tr,
            style: CustomTextStyles.titleSmallBold,
          ),
          SizedBox(
            width: 12.h,
          ),
          Expanded(
            child: Divider(
              thickness: 2.h,
              color: appTheme.gray300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "lbl_continue_with_google".tr,
      leftIcon: Container(
        margin: EdgeInsetsDirectional.only(end: 24.h),
        child: CustomImageView(
          imagePath: ImageConstant.imageGoogleIcon,
          height: 24.h,
          width: 22.h,
          fit: BoxFit.contain,
        ),
      ),
      buttonTextStyle: CustomTextStyles.bodyMediumGray900,
      onPressed: () async {
        AppLogger.debug("Continue With Google");
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.mainScreen);
      },
    );
  }

  _buildLoginWithAppleButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "lbl_continue_with_apple".tr,
      leftIcon: Container(
        margin: EdgeInsetsDirectional.only(end: 24.h),
        child: CustomImageView(
          imagePath: ImageConstant.imageAppleIcon,
          height: 24.h,
          width: 22.h,
          fit: BoxFit.contain,
        ),
      ),
      buttonTextStyle: CustomTextStyles.bodyMediumGray900,
      onPressed: () async {
        AppLogger.debug("Continue with Apple");
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.mainScreen);
      },
    );
  }

  _buildForgotPasswordButton(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          InkResponse(
            onTapUp: (details) {
              NavigatorService.pushNamed(AppRoutes.forgotPasswordScreen);
            },
            child: Text(
              "lbl_forgot_password".tr,
              style: CustomTextStyles.titleSmallBold,
            ),
          ),
        ],
      ),
    );
  }
}
