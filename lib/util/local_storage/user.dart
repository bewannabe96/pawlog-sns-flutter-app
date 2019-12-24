import 'package:shared_preferences/shared_preferences.dart';

import 'package:pawlog/entity/entity.dart';

class UserLocalStorage {
  static const _storageKey = 'user:';

  static Future<void> writeUserInfo(UserBaseEntity entity) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt(_storageKey + 'user_id', entity.userID);
  }

  static Future<UserBaseEntity> readUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    final _userID = prefs.getInt(_storageKey + 'user_id');

    return UserBaseEntity(userID: _userID);
  }
}
