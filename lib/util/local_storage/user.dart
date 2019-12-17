import 'package:shared_preferences/shared_preferences.dart';

import 'package:pawlog/entity/entity.dart';

class UserLocalStorage {
  static const _storageKey = 'user:';

  static Future<void> writeUserInfo(UserInfoEntity entity) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt(_storageKey + 'user_id', entity.userID);
  }

  static Future<UserInfoEntity> readUserInfo(String userHash) async {
    final prefs = await SharedPreferences.getInstance();

    final _userID = prefs.getInt(_storageKey + 'user_id');

    return UserInfoEntity(userID: _userID);
  }
}
