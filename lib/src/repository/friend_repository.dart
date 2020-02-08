import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class FriendRepository {
  static Future<List<Friend>> fetchFriends(int userID) async {
    List<FriendEntity> friendEntities;
    try {
      friendEntities = await UserAPIClient.fetchFriends(userID);
    } catch (_) {}

    return friendEntities.map((entity) => Friend.fromEntity(entity)).toList();
  }
}
