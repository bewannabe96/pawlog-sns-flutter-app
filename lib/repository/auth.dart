import 'package:amazon_cognito_identity_dart/cognito.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/entity/entity.dart';

import 'package:pawlog/util/cognito_client.dart';
import 'package:pawlog/util/api/api.dart';
import 'package:pawlog/util/local_storage/local_storage.dart';

class AuthRepository {
  static Future<User> checkAuthentication() async {
    final userBaseEntity = await CognitoClient.authenticateFromStorage();
    if (userBaseEntity == null) {
      return null;
    }

    UserBaseEntity userEntity;
    try {
      userEntity = await UserAPIClient.fetchUserInfo(userBaseEntity.hash);
      UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      userEntity = await UserLocalStorage.readUserInfo();
    }

    return User.fromEntity(
      userBaseEntity: userBaseEntity,
      userEntity: userEntity,
    );
  }

  static Future<User> authenticate(String email, String password) async {
    CognitoUserEntity userBaseEntity;
    try {
      userBaseEntity = await CognitoClient.authenticate(email, password);
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

    UserBaseEntity userEntity;
    try {
      userEntity = await UserAPIClient.fetchUserInfo(userBaseEntity.hash);
      UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      userEntity = await UserLocalStorage.readUserInfo();
    }

    return User.fromEntity(
      userBaseEntity: userBaseEntity,
      userEntity: userEntity,
    );
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
