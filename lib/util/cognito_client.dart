import 'package:amazon_cognito_identity_dart/cognito.dart';

import 'package:pawlog/entity/entity.dart';

class CognitoClient {
  static final _userPool =
      CognitoUserPool('ap-southeast-1_BBYEpehDx', '7b8qlbiti2joh7939b1329mbjd');

  static Future<UserEntity> signIn(String email, String password) async {
    final cognitoUser = CognitoUser(email, _userPool);

    final authDetails =
        AuthenticationDetails(username: email, password: password);

    await cognitoUser.authenticateUser(authDetails);
    final attributes = await cognitoUser.getUserAttributes();

    var _hash, _email, _name;

    attributes.forEach((attr) {
      switch (attr.name) {
        case 'sub':
          _hash = attr.value;
          break;
        case 'email':
          _email = attr.value;
          break;
        case 'name':
          _name = attr.value;
          break;
      }
    });

    return UserEntity(
      hash: _hash,
      email: _email,
      name: _name,
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
