import 'package:flutter/material.dart';
import 'package:amazon_cognito_identity_dart/cognito.dart';

enum AuthErrorTypes {
  EmptyEmail,
  EmptyPassword,
  UserNotExist,
  NotAuthorized,
  UserNotConfirmed,
  Unknwon,
}

class AuthException implements Exception {
  const AuthException(this.type);

  final AuthErrorTypes type;
}

enum AuthStates {
  Unauthorized,
  Authorized,
}

class AuthProvider with ChangeNotifier {
  final _userPool =
      CognitoUserPool('ap-southeast-1_eivBFmXDg', '4mtoug2h2ulrehc3juj7eesb25');

  CognitoUser _cognitoUser;
  CognitoUserSession _session;

  AuthStates _authState = AuthStates.Unauthorized;
  AuthStates get authState => _authState;

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;

  Future<void> signIn(
    String email,
    String password,
  ) async {
    if (email == '') {
      throw AuthException(AuthErrorTypes.EmptyEmail);
    } else if (password == '') {
      throw AuthException(AuthErrorTypes.EmptyPassword);
    }

    _cognitoUser = CognitoUser(email, _userPool);

    final authDetails =
        AuthenticationDetails(username: email, password: password);

    _isProcessing = true;
    notifyListeners();
    try {
      _session = await _cognitoUser.authenticateUser(authDetails);
      _authState = AuthStates.Authorized;
    } on CognitoClientException catch (e) {
      switch (e.code) {
        case 'UserNotFoundException':
          throw AuthException(AuthErrorTypes.UserNotExist);
        case 'NotAuthorizedException':
          throw AuthException(AuthErrorTypes.NotAuthorized);
        case 'UserNotConfirmedException':
          throw AuthException(AuthErrorTypes.UserNotConfirmed);
        default:
          throw AuthException(AuthErrorTypes.Unknwon);
      }
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }
}
