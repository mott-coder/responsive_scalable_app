import 'package:flutter/material.dart';

// Figma design reference dimensions
const double figmaDesignWidth = 430;
const double figmaDesignHeight = 932;

/// Enum to define device types
enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

/// Responsive extension for scaling width, height, and font sizes
extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;

  /// Scale based on width
  double get w => (this * _width) / figmaDesignWidth;

  /// Scale based on height
  double get h => (this * _height) / figmaDesignHeight;

  /// Scale font size
  double get fSize => (this * _width) / figmaDesignWidth;
}

/// Utility for rounding and checking values
extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) =>
      double.parse(toStringAsFixed(fractionDigits));

  double isNonZero({num defaultValue = 0.0}) =>
      this > 0 ? this : defaultValue.toDouble();
}

/// Responsive Sizer that detects screen size & orientation
class Sizer extends StatelessWidget {
  final ResponsiveBuild builder;

  const Sizer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.setScreenSize(constraints, orientation);
            return builder(context, orientation, SizeUtils.deviceType);
          },
        );
      },
    );
  }
}

/// Utility class for screen size, orientation, and device type detection
class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double width;
  static late double height;

  /// Breakpoints for device types
  static const double mobileBreakpoint = 450;
  static const double tabletBreakpoint = 800;

  /// Sets the screen size and determines the device type
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth.isNonZero(defaultValue: figmaDesignWidth);
      height = constraints.maxHeight.isNonZero(defaultValue: figmaDesignHeight);
    } else {
      width = constraints.maxHeight.isNonZero(defaultValue: figmaDesignHeight);
      height = constraints.maxWidth.isNonZero(defaultValue: figmaDesignWidth);
    }

    deviceType = _getDeviceType(width);
  }

  /// Determines the device type based on width
  static DeviceType _getDeviceType(double width) {
    if (width >= tabletBreakpoint) {
      return DeviceType.desktop;
    } else if (width >= mobileBreakpoint) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }
}
