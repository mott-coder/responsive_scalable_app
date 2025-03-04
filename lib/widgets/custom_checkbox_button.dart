import 'package:flutter/material.dart';
import '../core/app_export.dart';

// ignore: must_be_immutable
class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton({
    super.key,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    required this.onChange,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.overflow,
    this.textAlignment,
    this.isExpandedText = false,
    required this.value,
  });
  final BoxDecoration? decoration;
  final Alignment? alignment;
  final bool? isRightCheck;
  final double? iconSize;
  bool value;
  final Function(bool) onChange;
  final String? text;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final TextAlign? textAlignment;
  final bool isExpandedText;
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildCheckBoxWidget,
          )
        : buildCheckBoxWidget;
  }

  Widget get buildCheckBoxWidget => GestureDetector(
        onTap: () {
          value = !(value);
          onChange(value);
        },
        child: Container(
          decoration: decoration,
          width: width,
          padding: padding,
          child: (isRightCheck ?? false) ? rightSideCheckbox : leftSideCheckbox,
        ),
      );
  Widget get leftSideCheckbox => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkboxWidget,
          SizedBox(
            width: (text != null && text!.isNotEmpty) ? 8 : 0,
          ),
          isExpandedText ? Expanded(child: textWidget) : textWidget
        ],
      );
  Widget get rightSideCheckbox => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isExpandedText ? Expanded(child: textWidget) : textWidget,
          SizedBox(
            width: (text != null && text!.isNotEmpty) ? 8 : 0,
          ),
          checkboxWidget,
        ],
      );
  Widget get textWidget => Text(
        text ?? "",
        textAlign: textAlignment ?? TextAlign.start,
        overflow: overflow,
        style: textStyle ?? CustomTextStyles.bodyMediumGray900,
      );
  Widget get checkboxWidget => SizedBox(
        height: iconSize ?? 24.h,
        width: iconSize ?? 24.h,
        child: Checkbox(
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            value: value,
            checkColor: appTheme.gray10001,
            activeColor: appTheme.lightBlueA700,
            side: WidgetStateBorderSide.resolveWith(
              (states) => BorderSide(
                color: appTheme.blueGray100,
              ),
            ),
            onChanged: (value) {
              onChange(value!);
            }),
      );
}
