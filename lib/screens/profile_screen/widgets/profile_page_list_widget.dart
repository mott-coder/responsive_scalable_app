import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class ProfilePageListWidget extends StatelessWidget {
  const ProfilePageListWidget(
      {super.key,
      required this.leadingIconImage,
      required this.title,
      this.style,
      this.color,
      this.trailingIconImage});
  final String leadingIconImage;
  final String title;
  final TextStyle? style;
  final Color? color;
  final String? trailingIconImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomIconButton(
            height: 56.h,
            width: 56.h,
            padding: EdgeInsetsDirectional.all(16.h),
            decoration: IconButtonStyleHelper.fillPrimaryContainer,
            child: CustomImageView(
              imagePath: leadingIconImage,
              color: color ?? appTheme.lightBlueA700,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 16.h,
                ),
                child: Text(
                  title,
                  style: style ?? CustomTextStyles.headlineSmallRegular,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 18.h,
          ),
          trailingIconImage != null
              ? CustomImageView(
                  imagePath: trailingIconImage,
                  height: 32.h,
                  width: 34.h,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
