import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/api/api.dart';

class UserRepository {
  static Future<List<Friend>> fetchFriends(int userID) async {
    return await CombinedAPIClient.fetchUserFriends(userID);
  }

  static Future<List<Chat>> fetchChats(int userID) async {
    return await CombinedAPIClient.fetchUserChat(userID);
  }

  static Future<Profile> fetchProfile(int userid) async {
    return Profile();
  }
}
