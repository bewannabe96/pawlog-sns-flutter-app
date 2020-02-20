import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class UserRepository {
  static Future<User> fetchUser(int userID) async {
    UserEntity userEntity;

    userEntity = await UserAPIClient.fetchUser(userID);

    return User.fromEntity(userEntity);
  }

  static Future<User> fetchUserByHash(String userHash) async {
    UserEntity userEntity;

    userEntity = await UserAPIClient.fetchUserByHash(userHash);

    return User.fromEntity(userEntity);
  }

  static Future<Family> fetchUserFamily(int userID) async {
    FamilyEntity familyEntity;

    familyEntity = await UserAPIClient.fetchFamily(userID);

    return familyEntity == null ? null : Family.fromEntity(familyEntity);
  }

  static Future<Family> createFamily(int userID, String name) async {
    final familyEntity = await UserAPIClient.createFamily(userID, name);

    return Family.fromEntity(familyEntity);
  }
}
