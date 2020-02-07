import 'package:amazon_cognito_identity_dart/cognito.dart';

import 'package:pawlog/src/util/local_storage/local_storage.dart';

import 'package:pawlog/src/entity/entity.dart';

class CognitoClient {
  static final _cognitoStorage = CognitoLocalStorage();
  static final _userPool = CognitoUserPool(
    // TODO: Connect to Cognito
    'ap-southeast-1_NaVJ6Sf4p',
    '1ej89k8uegcbjg1k7t4aic3v8d',
    storage: _cognitoStorage,
  );

  static Future<CognitoUserEntity> authenticateFromStorage() async {
    // TODO: Connect to Cognito
    // final currentUser = await _userPool.getCurrentUser();
    // if (currentUser == null) {
    //   return null;
    // }

    // final session = await currentUser.getSession();
    // if (!session.isValid()) {
    //   return null;
    // }

    // return CognitoUserEntity.fromCognitoUserAttrs(
    //   await currentUser.getUserAttributes(),
    // );
    return CognitoUserEntity(hash: '0e5f8cbf-7c34-423f-bdb9-e0e823d08d23');
  }

  static Future<CognitoUserEntity> authenticate(
      String email, String password) async {
    // TODO: Connect to Cognito
    // final cognitoUser = CognitoUser(
    //   email,
    //   _userPool,
    // );

    // final authDetails =
    //     AuthenticationDetails(username: email, password: password);

    // try {
    //   await cognitoUser.authenticateUser(authDetails);

    //   return CognitoUserEntity.fromCognitoUserAttrs(
    //     await cognitoUser.getUserAttributes(),
    //   );
    // } on CognitoClientException catch (e) {
    //   switch (e.code) {
    //     case 'UserNotFoundException':
    //       throw ('UserNotFoundException');
    //       break;
    //     case 'NotAuthorizedException':
    //       throw ('NotAuthorizedException');
    //       break;
    //     case 'UserNotConfirmedException':
    //       throw ('UserNotConfirmedException');
    //       break;
    //     case 'NetworkError':
    //       throw ('NetworkException');
    //       break;
    //     default:
    //       throw ('UnknownException');
    //   }
    // }
    return CognitoUserEntity(hash: '0e5f8cbf-7c34-423f-bdb9-e0e823d08d23');
  }

  static Future<void> register(
    String email,
    String name,
    String password,
  ) async {
    final userAttributes = [
      new AttributeArg(name: 'email', value: email),
      new AttributeArg(name: 'name', value: name),
    ];

    await _userPool.signUp(email, password, userAttributes: userAttributes);
  }

  static Future<void> confirmRegistration(
    String email,
    String verificationCode,
  ) async {
    final cognitoUser = CognitoUser(email, _userPool);
    await cognitoUser.confirmRegistration(verificationCode);
  }

  static Future<void> resendConfirmCode(String email) async {
    final cognitoUser = CognitoUser(email, _userPool);
    await cognitoUser.resendConfirmationCode();
  }
}
