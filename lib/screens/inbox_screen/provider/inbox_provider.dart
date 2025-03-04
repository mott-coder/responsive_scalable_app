import 'package:flutter/material.dart';

import '../../../core/providers/auth_provider.dart';

import '../models/inbox_model.dart';
import '../models/message_model.dart';

class InboxProvider extends ChangeNotifier {
  InboxModel inboxModel = InboxModel();
  AuthProvider authProvider = AuthProvider();

  List<MessageModel> myMessages = [];
  String? errorFetchingMessages;

  bool isFetchingMessages = false;

  Future<void> getMessages() async {
    isFetchingMessages = true;
    notifyListeners();
    // Fetch Messages
    isFetchingMessages = false;
    notifyListeners();
  }

  Future<void> resetMessages() async {
    myMessages = [];
    errorFetchingMessages = null;
  }
}
