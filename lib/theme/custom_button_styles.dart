import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlueGrayTL8 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        elevation: 0,
        padding: EdgeInsetsDirectional.zero,
      );
}
