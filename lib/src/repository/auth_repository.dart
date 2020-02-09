import 'package:pawlog/src/util/cognito_client.dart';

class AuthRepository {
  static Future<String> authenticate(String email, String password) async {
    final cognitoUserEntity = await CognitoClient.authenticate(email, password);

    return cognitoUserEntity.hash;
  }
}
