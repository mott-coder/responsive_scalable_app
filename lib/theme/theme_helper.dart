import 'package:flutter/material.dart';
import '../../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

//Helper class for managing themes and colors
class ThemeHelper {
  //the current app theme
  final _appTheme = PrefUtils().getThemeData();

  //A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  //A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  //Returns the lightCode colors for the current theme
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ///Returns the current theme data
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      // scaffoldBackgroundColor: appTheme.whiteA70001,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.blueGray10001,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: appTheme.blueGray100,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
      ),
      dividerTheme: DividerThemeData(
        thickness: 4,
        space: 4,
        color: colorScheme.primary,
      ),
    );
  }

  ///Returns the lightCode colors for the current theme
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data
  ThemeData themeData() => _getThemeData();
}

///Class containing the supported text themes styles
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray400,
          fontSize: 16.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray600,
          fontSize: 14.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 12.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 32.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 32.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: appTheme.lightBlueA700,
          fontSize: 16.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.lightBlueA700,
          fontSize: 14.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w500,
        ),
      );
}

///Class containing the supported color schemes
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF0092f5), //(0XFF5A5A5A),
    primaryContainer: Color(0XFFFFFFFF),
    onErrorContainer: Color(0XFF383838),
    onPrimary: Color(0X0C0C0C0D),
    onPrimaryContainer: Color(0XFF2C2C2C),
  );
}

///Class containing custom colors for a lightCode theme
class LightCodeColors {
  //Red
  // Color get redA200 => const Color(0XFFF75555);
  Color get redA200 => const Color(0XFFFF5A5F);

  //Black
  Color get black900 => const Color(0XFF000000);

  //BlueGray
  Color get blueGray100 => const Color(0XFFCCCCCC);
  Color get blueGray10001 => const Color(0XFFD9D9D9);

  //Light Blue
  Color get lightBlueA700 => const Color(0XFF0192F5);

  //Gray
  Color get gray100 => const Color(0XFFF2F2F2);
  Color get gray10001 => const Color(0XFFF5F5F5);
  Color get gray300 => const Color(0XFFE6E6E6);
  Color get gray400 => const Color(0XFFB3B3B3);
  Color get gray40001 => const Color(0XFFB1B1B1);
  Color get gray500 => const Color(0XFF999999);
  Color get gray600 => const Color(0XFF757575);
  Color get gray900 => const Color(0XFF1E1E1E);
}
