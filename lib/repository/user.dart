import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/pawlog_api_client.dart';

class UserRepository {
  static Future<List<Pet>> fetchFamily(int userID) async {
    return await PawlogAPIClient.loadUserFamily(userID);
  }

  static Future<List<Friend>> fetchFriends(int userID) async {
    return await PawlogAPIClient.loadUserFriends(userID);
  }

  static Future<List<Chat>> fetchChats(int userID) async {
    return await PawlogAPIClient.loadUserChat(userID);
  }

  static Future<Profile> fetchProfile(int userid) async {
    return Profile();
  }
}
