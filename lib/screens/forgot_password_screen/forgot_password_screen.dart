import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/app_export.dart';

import '../../widgets/custom_text_form_field.dart';
import 'provider/forgot_password_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          color: appTheme.gray10001,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsetsDirectional.only(
              start: 20.h,
              top: 15.h,
              end: 20.h,
              // bottom: 12.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "msg_reset_password".tr,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkResponse(
                          onTapUp: (details) {
                            NavigatorService.goBack();
                          },
                          child: SizedBox(
                            height: 32.h,
                            width: 32.h,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 28.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 36.h,
                  thickness: 1.h,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "msg_enter_your_account_email_to_receive_a_reset_password_link"
                        .tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyLargeGray600,
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildEmailInput(context),
                        _buildSendResetEmailButton(context),
                      ],
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
    return Selector<ForgotPasswordProvider, TextEditingController?>(
      selector: (context, provider) => provider.emailInputController,
      builder: (context, emailInputController, child) {
        return CustomTextFormField(
          controller: emailInputController,
          hintText: "msg_email_address".tr,
          textInputType: TextInputType.emailAddress,
          prefix: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.h, vertical: 10.h),
              child: Icon(Icons.mail_outline_rounded)),
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

  Widget _buildSendResetEmailButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.symmetric(vertical: 36.h),
      child: Consumer<ForgotPasswordProvider>(
        builder: (context, provider, child) {
          return CustomElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Consumer<ForgotPasswordProvider>(
                          builder: (context, providerPass, child) {
                        return SizedBox(
                          height: 60.h,
                          child: AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (providerPass
                                    .isSendingPasswordResetEmail) ...[
                                  SpinKitRipple(
                                    color: appTheme.lightBlueA700,
                                  ),
                                  SizedBox(height: 12.h),
                                  Text("msg_sending_password_reset_email".tr),
                                ] else if (providerPass
                                        .hasCompletedSendingPasswordResetEmail &&
                                    providerPass
                                            .passwordResetEmailSendingError !=
                                        null) ...[
                                  Text(providerPass
                                      .passwordResetEmailSendingError!),
                                  SizedBox(height: 12.h),
                                  Icon(Icons.cancel_outlined,
                                      color: appTheme.lightBlueA700,
                                      size: 60.h),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      provider.resetPageData();
                                      NavigatorService.goBack();
                                    },
                                    text: "lbl_close".tr,
                                    buttonTextStyle:
                                        CustomTextStyles.titleSmallGray100,
                                  ),
                                ] else if (providerPass
                                        .hasCompletedSendingPasswordResetEmail &&
                                    providerPass
                                            .passwordResetEmailSendingError ==
                                        null) ...[
                                  Text("msg_password_reset_email_is_sent".tr),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Icon(Icons.check_circle,
                                      color: appTheme.lightBlueA700,
                                      size: 60.h),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      provider.resetPageData();
                                      NavigatorService.goBack();
                                    },
                                    text: "lbl_close".tr,
                                    buttonTextStyle:
                                        CustomTextStyles.titleSmallGray100,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      });
                    });
                await provider.resetPassword();
              } else {
                AppLogger.debug("Form is not valid");
              }
            },
            text: "lbl_send_reset_password_email".tr,
          );
        },
      ),
    );
  }
}
