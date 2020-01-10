import 'package:amazon_cognito_identity_dart/cognito.dart';

import 'package:pawlog/entity/entity.dart';

import 'package:pawlog/util/cognito_client.dart';

class AuthRepository {
  static Future<String> checkAuthentication() async {
    final cognitoUserEntity = await CognitoClient.authenticateFromStorage();

    return cognitoUserEntity?.hash ?? null;
  }

  static Future<String> authenticate(String email, String password) async {
    CognitoUserEntity cognitoUserEntity;
    try {
      cognitoUserEntity = await CognitoClient.authenticate(email, password);
    } on CognitoClientException catch (e) {
      switch (e.code) {
        case 'UserNotFoundException':
          throw ('UserNotFoundException');
          break;
        case 'NotAuthorizedException':
          throw ('NotAuthorizedException');
          break;
        case 'UserNotConfirmedException':
          throw ('UserNotConfirmedException');
          break;
        case 'NetworkError':
          throw ('NetworkException');
          break;
        default:
          throw ('UnknownException');
      }
    }

    return cognitoUserEntity?.hash ?? null;
  }

  static Future<void> register(
    String email,
    String name,
    String password,
  ) async {
    await CognitoClient.register(email, name, password);
  }

  static Future<void> confirmRegistration(
    String email,
    String verificationCode,
  ) async {
    await CognitoClient.confirmRegistration(email, verificationCode);
  }

  static Future<void> resendConfirmCode(String email) async {
    await CognitoClient.resendConfirmCode(email);
  }
}
