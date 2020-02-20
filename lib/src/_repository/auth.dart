import 'package:pawlog/src/util/cognito_client.dart';

class AuthRepository {
  static Future<String> checkAuthentication() async {
    final cognitoUserEntity = await CognitoClient.authenticateFromStorage();

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
