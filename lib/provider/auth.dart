import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool tempIsSignedIn;

  bool get isSignedIn => tempIsSignedIn;

  void signIn() {
    tempIsSignedIn = true;
    notifyListeners();
  }

  void signOut() {
    tempIsSignedIn = false;
    notifyListeners();
  }
}
