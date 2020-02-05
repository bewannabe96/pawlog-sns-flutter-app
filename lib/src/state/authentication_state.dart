import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/repository/repository.dart';

enum AuthStatus { Unauthorized, Processing, Authorized, Failed }

class AuthenticationState with ChangeNotifier {
  AuthStatus _authStatus;
  String _message;
  User _user;

  // public getters
  AuthStatus get status => _authStatus;
  bool get isAuthorized => _authStatus == AuthStatus.Authorized;
  String get message => _message;
  User get user => _user;

  void attemptSignIn(String email, String password) async {
    _authStatus = AuthStatus.Processing;
    notifyListeners();

    try {
      final userHash = await AuthRepository.authenticate(email, password);
      if (userHash != null) {
        _user = await UserRepository.fetchUserInfo(userHash);
        _authStatus = AuthStatus.Authorized;
        notifyListeners();
      }
    } catch (e) {
      switch (e) {
        case 'UserNotFoundException':
          _authStatus = AuthStatus.Failed;
          _message = 'User does not exist.';
          notifyListeners();
          break;
        case 'NotAuthorizedException':
          _authStatus = AuthStatus.Failed;
          _message = 'Incorrect username or password.';
          notifyListeners();
          break;
        case 'UserNotConfirmedException':
          _authStatus = AuthStatus.Failed;
          _message = 'User not confirmed.';
          notifyListeners();
          break;
        default:
          _authStatus = AuthStatus.Failed;
          _message = e.toString();
          notifyListeners();
      }
    }
  }
}
