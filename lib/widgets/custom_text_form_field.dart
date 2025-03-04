import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineBlueGrayTL8 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appTheme.blueGray10001,
          width: 1,
        ),
      );
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    required this.autofocus,
    this.textStyle,
    required this.obscureText,
    required this.readOnly,
    this.onTap,
    this.textInputAction = TextInputAction.newline,
    this.textInputType = TextInputType.multiline,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.onSubmitted,
  });
  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsetsDirectional? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      decoration: boxDecoration,
      child: TextFormField(
        scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        controller: controller,
        focusNode: focusNode,
        onTapOutside: (event) {
          if (focusNode != null) {
            focusNode?.unfocus();
          } else {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        autofocus: autofocus,
        style: textStyle ?? theme.textTheme.bodyMedium,
        obscureText: obscureText,
        readOnly: readOnly,
        onTap: () {
          onTap?.call();
        },
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: decoration,
        validator: validator,
        onFieldSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodyMedium,
        errorMaxLines: 2,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsetsDirectional.all(
              10.h,
            ),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appTheme.blueGray10001,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appTheme.blueGray10001,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            color: appTheme.redA200,
            width: 1,
          ),
        ),
        // focusedErrorBorder:
        //     (borderDecoration ?? const UnderlineInputBorder()).copyWith(
        //   borderSide: BorderSide(
        //     color: appTheme.pink500,
        //     width: 2,
        //   ),
        // ),
        // errorStyle: TextStyle(
        //   color: appTheme.pink500,
        //   fontSize: 12.fSize,
        // ),
      );
}
