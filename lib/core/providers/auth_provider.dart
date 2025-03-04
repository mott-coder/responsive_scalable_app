import 'package:flutter/material.dart';
import 'package:responsive_scalable_app/core/app_export.dart';

class AuthProvider extends ChangeNotifier {
  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour >= 0 && hour < 12) {
      return "msg_good_morning".tr;
    } else if (hour >= 12 && hour < 17) {
      return "msg_good_afternoon".tr;
    } else {
      return "msg_good_evening".tr;
    }
  }
}
