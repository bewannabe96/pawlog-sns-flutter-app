import 'package:pawlog/src/util/cognito_client.dart';

class AuthRepository {
  Future<String> authenticate(String email, String password) async {
    try {
      final cognitoUserEntity =
          await CognitoClient.authenticate(email, password);

      return cognitoUserEntity.hash;
    } catch (e) {
      switch (e) {
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
  }
}
