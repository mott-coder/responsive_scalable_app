import 'package:flutter/material.dart';

import '../models/profile_model.dart';

class ProfileProvider with ChangeNotifier {
  // AuthProvider authProvider = AuthProvider();
  ProfileModel? userProfile;

  Future<void> getUserProfile() async {
    notifyListeners();
  }

  Future<void> updateUserProfile(Map<String, dynamic> data) async {
    notifyListeners();
  }

  Future<void> resetUserProfile() async {
    userProfile = null;
    notifyListeners();
  }
}
