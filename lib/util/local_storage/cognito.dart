import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CognitoLocalStorage extends CognitoStorage {
  @override
  Future setItem(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    return prefs.getString(key);
  }

  @override
  Future getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future removeItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
