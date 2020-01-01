import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/util/api/api.dart';

class UserAPIClient extends PawlogAPIClient {
  static Future<UserBaseEntity> fetchUserInfo(String userHash) async {
    throw ('not implemented');
  }

  static Future<ProfileEntity> fetchUserProfile(int userID) async {
    throw ('not implemented');
  }

  static Future<FamilyEntity> fetchFamily(int userID) async {
    throw ('');
  }

  static Future<void> createFamily(int userID, FamilyEntity familyEntity) {
    return null;
  }

  static Future<FamilyEntity> registerPet(
    int userID,
    FamilyEntity familyEntity,
    PetEntity petEntity,
  ) async {
    return null;
  }

  static Future<List<FriendEntity>> fetchFriends(int userID) async {
    throw ('');
  }

  static Future<List<ChatHeaderEntity>> fetchChatHeaders(int userID) async {
    throw ('');
  }
}
