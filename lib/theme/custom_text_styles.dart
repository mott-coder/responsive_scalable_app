import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {}

///A collection of pre-defined text styles for customizing text appearance
///categorized by different font families and weights.
///Additionally this class includes extensions on [TextStyle]
///to easily apply specific font families to text

class CustomTextStyles {
  //Body text textstyles
  static TextStyle get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get bodyLargeGray900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray900,
      );
  static TextStyle get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
      );
  static TextStyle get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static TextStyle get bodyMediumBlack900 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get bodyMediumGray900 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
      );
  static TextStyle get bodyMediumGray100 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray100,
      );
  static TextStyle get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
      );

  // headline text style
  static TextStyle get headlineLargeSemiBold =>
      theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get headlineSmallGray400 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray400,
      );
  static TextStyle get headlineSmallRegular =>
      theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static TextStyle get headlineSmallRegularRed =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.redA200,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get headlineSmallSemiBold =>
      theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );

  // Title text style
  static TextStyle get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumBoldRed => theme.textTheme.titleMedium!
      .copyWith(fontWeight: FontWeight.w700, color: appTheme.redA200);
  static TextStyle get titleMediumGray600 =>
      theme.textTheme.titleMedium!.copyWith(color: appTheme.gray600);
  static TextStyle get titleMediumSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallBlack900 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallGray100 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray100,
      );
  static TextStyle get titleSmallGray400 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
      );
  static TextStyle get titleSmallGray600 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
      );
}
