import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class UserRepository {
  static Future<List<Friend>> fetchFriends(int userID) async {
    List<FriendEntity> friendEntities;
    try {
      friendEntities = await UserAPIClient.fetchFriends(userID);
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return friendEntities.map((entity) => Friend.fromEntity(entity)).toList();
  }

  static Future<List<ChatHeader>> fetchChatHeaders(int userID) async {
    List<ChatHeaderEntity> chatHeaderEntities;
    try {
      chatHeaderEntities = await UserAPIClient.fetchChatHeaders(userID);
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return chatHeaderEntities
        .map((entity) => ChatHeader.fromEntity(entity))
        .toList();
  }

  static Future<Friend> followUser(
    int actionUserID,
    int targetUserID,
    bool follow,
  ) async {
    final entity = await UserAPIClient.followUser(
      actionUserID,
      targetUserID,
      follow,
    );
    return Friend.fromEntity(entity);
  }
}
