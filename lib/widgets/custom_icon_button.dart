import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray900,
        borderRadius: BorderRadius.circular(22.h),
        border: Border.all(
          color: appTheme.gray600,
          width: 1.h,
        ),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray300,
        borderRadius: BorderRadius.circular(8.h),
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8.h),
      );

  static BoxDecoration get none => const BoxDecoration();
}

class CustomIconButton extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Widget child;

  const CustomIconButton(
      {super.key,
      this.alignment,
      this.height,
      this.width,
      this.decoration,
      this.padding,
      this.onTap,
      required this.child});
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: DecoratedBox(
          decoration: decoration ??
              BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(8.h),
                border: Border.all(
                  color: appTheme.blueGray10001,
                  width: 1.h,
                ),
              ),
          child: IconButton(
            padding: padding ?? EdgeInsetsDirectional.zero,
            onPressed: onTap,
            icon: child,
          ),
        ),
      );
}
