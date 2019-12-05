import 'package:pawlog/util/cognito_client.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/pawlog_api_client.dart';

class AuthRepository {
  static Future<User> authenticate(String email, String password) async {
    final user = await CognitoClient.signIn(email, password);
    final userInfo = await PawlogAPIClient.loadUserInfo(user.hash);

    return User.fromEntity(userEntity: user, userInfoEntity: userInfo);
  }

  static Future<void> register(
    String email,
    String name,
    String password,
  ) async {
    return await CognitoClient.register(email, name, password);
  }

  static Future<void> confirmRegistration(
    String email,
    String verificationCode,
  ) async {
    return await CognitoClient.confirmRegistration(email, verificationCode);
  }

  static Future<void> resendConfirmCode(String email) async {
    return await CognitoClient.resendConfirmCode(email);
  }
}
