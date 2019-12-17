import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:pawlog/entity/entity.dart';

class FamilyLocalStorage {
  static const _storageKey = 'family:';

  static Future<void> writeUserFamily(FamilyEntity familyEntity) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(
      _storageKey + 'family',
      jsonEncode(familyEntity.toJson()),
    );
  }

  static Future<FamilyEntity> readUserFamily() async {
    final prefs = await SharedPreferences.getInstance();

    final json = jsonDecode(prefs.getString(_storageKey + 'family'));

    return FamilyEntity.fromJson(json);
  }
}
