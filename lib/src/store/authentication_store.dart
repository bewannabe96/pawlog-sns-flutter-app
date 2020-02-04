import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/repository/repository.dart';

class AuthenticationStore with ChangeNotifier {
  User _user;

  bool get isSignedIn => _user != null;
  User get user => _user;

  void attemptSignIn(String email, String password) async {
    try {
      final userHash = await AuthRepository.authenticate(email, password);
      if (userHash != null) {
        _user = await UserRepository.fetchUserInfo(userHash);
        notifyListeners();
      }
    } catch (e) {
      switch (e) {
        case 'UserNotFoundException':
          //'User does not exist.
          break;
        case 'NotAuthorizedException':
          // Incorrect username or password.
          break;
        case 'UserNotConfirmedException':
          // User not confirmed.
          break;
        default:
        // Unknown Error
      }
    }
  }
}
