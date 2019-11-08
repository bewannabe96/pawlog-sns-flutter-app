import 'package:flutter/material.dart';
import 'package:pawlog/util/pawlog_api_client.dart';

class ProfileProvider with ChangeNotifier {
  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;

  Future<void> loadProfile(int userid) async {
    PawlogAPIClient.loadProfile(userid);
  }
}
