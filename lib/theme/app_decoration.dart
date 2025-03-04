import 'package:flutter/material.dart';

import '../core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillPrimaryContainer =>
      BoxDecoration(color: theme.colorScheme.primaryContainer);
  static BoxDecoration get outlineOnPrimary => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimary.withAlpha(20),
            spreadRadius: 1.h,
            blurRadius: 1.h,
            offset: const Offset(0, 1),
          ),
        ],
      );
}
