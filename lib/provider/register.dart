import 'package:flutter/material.dart';
import 'package:amazon_cognito_identity_dart/cognito.dart';

enum RegisterErrorTypes {
  EmailError,
  NameError,
  PasswordError,
  PasswordConfirmError,
  Unknown,
}

class RegisterException implements Exception {
  const RegisterException(this.type, this.message);

  final RegisterErrorTypes type;
  final String message;
}

enum VerificationErrorTypes {
  EmptyCode,
  MismatchCode,
  Unknown,
}

class VerificationException implements Exception {
  const VerificationException(this.type);

  final VerificationErrorTypes type;
}

class RegisterProvider with ChangeNotifier {
  final _userPool =
      CognitoUserPool('ap-southeast-1_eivBFmXDg', '4mtoug2h2ulrehc3juj7eesb25');

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;

  void _checkEntries(
    String email,
    String name,
    String password,
    String passwordConfirm,
  ) {
    if (email == '') {
      throw RegisterException(
        RegisterErrorTypes.EmailError,
        'Email should not be empty.',
      );
    } else if (name == '') {
      throw RegisterException(
        RegisterErrorTypes.NameError,
        'Name should not be empty.',
      );
    } else if (password == '') {
      throw RegisterException(
        RegisterErrorTypes.PasswordError,
        'Password cannot be empty.',
      );
    } else if (password.length < 8) {
      throw RegisterException(
        RegisterErrorTypes.PasswordError,
        'Password is too short.',
      );
    } else if (!RegExp(r"[a-z]").hasMatch(password)) {
      throw RegisterException(
        RegisterErrorTypes.PasswordError,
        'Password must contain lowercase characters.',
      );
    } else if (!RegExp(r"[A-Z]").hasMatch(password)) {
      throw RegisterException(
        RegisterErrorTypes.PasswordError,
        'Password must contain uppercase characters.',
      );
    } else if (!RegExp(r"[0-9]").hasMatch(password)) {
      throw RegisterException(
        RegisterErrorTypes.PasswordError,
        'Password must contain numeric character.',
      );
    } else if (password != passwordConfirm) {
      throw RegisterException(
        RegisterErrorTypes.PasswordConfirmError,
        'Password does not match.',
      );
    }
  }

  Future<void> register(
    String email,
    String name,
    String password,
    String passwordConfirm,
  ) async {
    _checkEntries(email, name, password, passwordConfirm);

    final userAttributes = [
      new AttributeArg(name: 'email', value: email),
      new AttributeArg(name: 'name', value: name),
    ];

    _isProcessing = true;
    notifyListeners();
    try {
      await _userPool.signUp(email, password, userAttributes: userAttributes);
    } on CognitoClientException catch (e) {
      switch (e.message) {
        case 'Invalid email address format.':
          throw RegisterException(
            RegisterErrorTypes.EmailError,
            'Invalid email address format.',
          );
        case 'User already exists':
          throw RegisterException(
            RegisterErrorTypes.EmailError,
            'User already exists with this email.',
          );
        default:
          throw RegisterException(
            RegisterErrorTypes.Unknown,
            e.message,
          );
      }
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  Future<void> confirmRegistration(
      String email, String verificationCode) async {
    if (verificationCode == '') {
      throw VerificationException(VerificationErrorTypes.EmptyCode);
    }

    final cognitoUser = CognitoUser(email, _userPool);

    try {
      await cognitoUser.confirmRegistration(verificationCode);
    } on CognitoClientException catch (e) {
      switch (e.code) {
        case 'CodeMismatchException':
          throw VerificationException(VerificationErrorTypes.MismatchCode);
        default:
          throw VerificationException(VerificationErrorTypes.Unknown);
      }
    }
  }

  Future<bool> resendConfirmationCode(String email) async {
    final cognitoUser = CognitoUser(email, _userPool);

    try {
      await cognitoUser.resendConfirmationCode();
      return true;
    } catch (error) {
      return false;
    }
  }
}
