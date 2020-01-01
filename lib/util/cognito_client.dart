import 'package:amazon_cognito_identity_dart/cognito.dart';

import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/util/local_storage/local_storage.dart';

class CognitoClient {
  static final _cognitoStorage = CognitoLocalStorage();
  static final _userPool = CognitoUserPool(
    'ap-southeast-1_NaVJ6Sf4p',
    '1ej89k8uegcbjg1k7t4aic3v8d',
    storage: _cognitoStorage,
  );

  static Future<CognitoUserEntity> authenticateFromStorage() async {
    final currentUser = await _userPool.getCurrentUser();
    if (currentUser == null) {
      return null;
    }

    final session = await currentUser.getSession();
    if (!session.isValid()) {
      return null;
    }

    return CognitoUserEntity.fromCognitoUserAttrs(
      await currentUser.getUserAttributes(),
    );
  }

  static Future<CognitoUserEntity> authenticate(
      String email, String password) async {
    final cognitoUser = CognitoUser(
      email,
      _userPool,
      storage: _cognitoStorage,
    );

    final authDetails =
        AuthenticationDetails(username: email, password: password);

    await cognitoUser.authenticateUser(authDetails);

    return CognitoUserEntity.fromCognitoUserAttrs(
      await cognitoUser.getUserAttributes(),
    );
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
