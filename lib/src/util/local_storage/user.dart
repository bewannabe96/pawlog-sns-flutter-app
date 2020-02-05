import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:pawlog/src/entity/entity.dart';

class UserLocalStorage {
  static const _storageKey = 'user:';

  static Future<void> writeUserInfo(UserEntity userEntity) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(
      _storageKey + 'user',
      jsonEncode(userEntity.toJson()),
    );
  }

  static Future<UserEntity> readUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    final json = prefs.getString(_storageKey + 'user');

    if (json != null) {
      return UserEntity.fromJson(jsonDecode(json));
    }

    return null;
  }
}
