import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_checkbox_button.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/register_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                            vertical: 18.h,
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
                                "msg_create_an_account".tr,
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
                                    _buildFullNameInput(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildEmailInput(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildPasswordInput(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildRepeatPasswordInput(context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildAcceptTnCAndDataPolicyCheckbox(
                                        context),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    _buildRegisterButton(context),
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
                              _buildContinueWithGoogleButton(context),
                              SizedBox(
                                height: 16.h,
                              ),
                              _buildContinueWithAppleButton(context),
                              SizedBox(
                                height: 16.h,
                              ),
                              // _buildContinueWithFacebookButton(context),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "msg_already_have_an_account".tr,
                                    style: CustomTextStyles.bodyMediumGray900,
                                  ),
                                  SizedBox(
                                    width: 4.h,
                                  ),
                                  InkResponse(
                                    onTapUp: (details) {
                                      NavigatorService.popAndPushNamed(
                                          AppRoutes.signInScreen);
                                    },
                                    child: Text(
                                      "lbl_sign_in_here".tr,
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

  Widget _buildFullNameInput(BuildContext context) {
    return Selector<RegisterProvider, TextEditingController?>(
      selector: (context, provider) => provider.fullNameInputController,
      builder: (context, fullNameInputController, child) {
        return CustomTextFormField(
          controller: fullNameInputController,
          hintText: "msg_full_name".tr,
          textInputType: TextInputType.text,
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.h,
            vertical: 10.h,
          ),
          // validator: (value) {
          //   return validateEmail(value);
          // },
          autofocus: false,
          obscureText: false,
          readOnly: false,
        );
      },
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return Selector<RegisterProvider, TextEditingController?>(
      selector: (context, provider) => provider.emailAddressInputController,
      builder: (context, emailAddressInputController, child) {
        return CustomTextFormField(
          controller: emailAddressInputController,
          hintText: "msg_email_address".tr,
          textInputType: TextInputType.emailAddress,
          suffix: Container(
            margin: EdgeInsetsDirectional.symmetric(
                horizontal: 16.h, vertical: 10.h),
            child: Icon(Icons.mail_outline_rounded),
          ),
          suffixConstraints: BoxConstraints(
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
    return Consumer<RegisterProvider>(
      builder: (context, provider, child) {
        return CustomTextFormField(
          controller: provider.passwordInputController,
          hintText: "msg_password".tr,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          suffix: InkResponse(
            onTapUp: (details) {
              provider.changePasswordVisibility();
            },
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                horizontal: 16.h,
                vertical: 10.h,
              ),
              child: provider.showRepeatPassword
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off_rounded),
            ),
          ),
          suffixConstraints: BoxConstraints(
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
            return validatePasswordStrength(value);
          },
        );
      },
    );
  }

  Widget _buildRepeatPasswordInput(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, provider, child) {
        return CustomTextFormField(
          controller: provider.repeatPasswordInputController,
          hintText: "msg_repeat_password".tr,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          suffix: InkResponse(
            onTapUp: (details) {
              provider.changeRepeatPasswordVisibility();
            },
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                horizontal: 16.h,
                vertical: 10.h,
              ),
              child: provider.showRepeatPassword
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off_rounded),
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 44.h,
          ),
          obscureText: !provider.showRepeatPassword,
          autofocus: false,
          readOnly: false,
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.h,
            vertical: 10.h,
          ),
          validator: (value) {
            return validateRepeatPassword(
                value, provider.passwordInputController.text);
          },
        );
      },
    );
  }

  Widget _buildAcceptTnCAndDataPolicyCheckbox(BuildContext context) {
    return Selector<RegisterProvider, bool?>(
      selector: (context, provider) => provider.acceptTnCAndDataPolicy,
      builder: (context, acceptTnCAndDataPolicy, child) {
        return FormField<bool>(
          validator: (value) {
            if (value == false) {
              return "err_msg_field_is_required".tr;
            } else {
              return null;
            }
          },
          builder: (FormFieldState<bool> state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckboxButton(
                  value: acceptTnCAndDataPolicy ?? false,
                  onChange: (value) {
                    state.didChange(value);
                    context.read<RegisterProvider>().changeCheckboxValue(value);
                  },
                  decoration: state.hasError
                      ? BoxDecoration(
                          border: Border.all(color: appTheme.redA200),
                        )
                      : null,
                ),
                SizedBox(
                  width: 6.h,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: CustomTextStyles.bodyMediumGray900,
                      children: [
                        TextSpan(text: "msg_accept_the".tr),
                        TextSpan(
                          text: "lbl_terms_and_conditions".tr,
                          style: CustomTextStyles.titleMediumBold,
                          recognizer: TapGestureRecognizer()
                            ..onTapUp = (details) {
                              NavigatorService.pushNamed(
                                  AppRoutes.termsAndConditionsScreen);
                              AppLogger.debug(
                                  "Open Terms and Conditions Screen");
                            },
                        ),
                        TextSpan(
                          text: "msg_you_will_also_accept_our_data_policy".tr,
                        ),
                        TextSpan(
                          text: "lbl_data_privacy_policy".tr,
                          style: CustomTextStyles.titleMediumBold,
                          recognizer: TapGestureRecognizer()
                            ..onTapUp = (details) {
                              NavigatorService.pushNamed(
                                  AppRoutes.privacyPolicyScreen);
                              AppLogger.debug("Open Data Policy Screen");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, registerProvider, child) {
        return CustomElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              AppLogger.debug("Form is valid");
              NavigatorService.pushNamedAndRemoveUntil(AppRoutes.mainScreen);
            } else {
              AppLogger.debug("Form is not valid");
            }
          },
          text: "lbl_register_account".tr,
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

  Widget _buildContinueWithGoogleButton(BuildContext context) {
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
      onPressed: () async {},
    );
  }

  _buildContinueWithAppleButton(BuildContext context) {
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
      onPressed: () async {},
    );
  }
}
