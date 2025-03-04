import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

import '../../../widgets/custom_outlined_button.dart';

class LogoutModal extends StatefulWidget {
  const LogoutModal({super.key});

  @override
  State<LogoutModal> createState() => _LogoutModalState();
}

class _LogoutModalState extends State<LogoutModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.only(
        start: 20.h,
        top: 9.h,
        end: 20.h,
        bottom: 46.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.gray10001,
        borderRadius: BorderRadius.vertical(top: Radius.circular(44.h)),
        border: Border.all(
          color: appTheme.gray100,
          width: 1.h,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                Navigator.pop(context);
              }
            },
            child: Container(
              height: 3.h,
              width: 38.h,
              decoration: BoxDecoration(
                color: appTheme.gray300,
                borderRadius: BorderRadius.circular(1.h),
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            "msg_are_you_sure".tr,
            style: CustomTextStyles.titleLargeBold,
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "lbl_cancel".tr,
                    buttonTextStyle: CustomTextStyles.titleMediumSemiBold,
                  ),
                ),
                SizedBox(
                  width: 12.h,
                ),
                Expanded(
                  child: CustomOutlinedButton(
                    onPressed: () async {
                      NavigatorService.pushNamedAndRemoveUntil(
                          AppRoutes.initialRoute);
                    },
                    text: "lbl_yes_logout".tr,
                    buttonTextStyle: CustomTextStyles.titleMediumBoldRed,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 28.h,
          )
        ],
      ),
    );
  }
}
