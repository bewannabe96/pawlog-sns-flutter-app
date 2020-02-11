import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class UserRepository {
  static Future<User> fetchUserInfo(String userHash) async {
    UserEntity userEntity;

    userEntity = await UserAPIClient.fetchUserInfo(userHash);

    return User.fromEntity(userEntity);
  }

  static Future<Profile> fetchUserProfile(
      int userID, int requestinUserID) async {
    ProfileEntity profileEntity;

    profileEntity =
        await UserAPIClient.fetchUserProfile(userID, requestinUserID);

    return Profile.fromEntity(profileEntity);
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
