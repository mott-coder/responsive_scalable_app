import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomOutlinedButton extends BaseButton {
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? label;

  const CustomOutlinedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    required super.text,
    super.onPressed,
    super.buttonStyle,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    super.margin,
    super.alignment,
  });
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildOutlinedButtonWidget,
          )
        : buildOutlinedButtonWidget;
  }

  Widget get buildOutlinedButtonWidget => Container(
        height: height ?? 44.h,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: OutlinedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ?? CustomTextStyles.bodyMediumGray100,
              ),
              rightIcon ?? const SizedBox.shrink()
            ],
          ),
        ),
      );
}
