import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  Future<void> getHomeData() async {
    //Fetch Home Data from API
    notifyListeners();
  }
}
