import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/model/model.dart';

class PawlogAPIClient {
  static final http.Client _client = http.Client();

  static const _apiServerHost =
      'https://x6hqoxn4w5.execute-api.ap-southeast-1.amazonaws.com/dev';

  static Future<UserInfoEntity> loadUserInfo(String userHash) async {
    return UserInfoEntity(userID: 1);
  }

  static Future<List<Pet>> loadUserFamily(int userid) async {
    return [
      Pet(1, 'Cash', 'Pug', ''),
      Pet(2, 'Soye', 'Pug', ''),
    ];
  }

  static Future<List<Friend>> loadUserFriends(int userid) async {
    return [
      Friend(userID: 1, name: 'Kate', email: 'katekim@naver.com'),
      Friend(userID: 2, name: 'John', email: 'john@naver.com'),
      Friend(userID: 3, name: 'William', email: 'will@naver.com'),
      Friend(userID: 4, name: 'Charlie', email: 'charlie@naver.com'),
    ];
  }

  static Future<List<Chat>> loadUserChat(int userid) async {
    return [
      Chat(
        chatID: 1,
        userName: 'Kate',
        lastMessage: 'What is going on?',
        lastMessageTime: '4:30 PM',
      ),
      Chat(
        chatID: 2,
        userName: 'John',
        lastMessage: 'How are you?',
        lastMessageTime: '4:30 PM',
      ),
      Chat(
        chatID: 3,
        userName: 'William',
        lastMessage: 'Let\'s hang out',
        lastMessageTime: '4:30 PM',
      ),
      Chat(
        chatID: 4,
        userName: 'Charlie',
        lastMessage: 'Whatup',
        lastMessageTime: '4:30 PM',
      ),
    ];
  }

  static Future<Profile> loadProfile(int userid) async {
    var path = '$_apiServerHost/profile/$userid';

    final response = await _client.get(path);

    if (response.statusCode != 200) {
      throw Exception('error getting profile');
    }

    var json = jsonDecode(response.body);
    return UserProfile.fromJSON(json);
  }

  static Future<List<Story>> loadProfileStories(int userid) async {
    var path = '$_apiServerHost/story/user/$userid';

    final response = await _client.get(path);

    if (response.statusCode != 200) {
      throw Exception('error getting profile stories');
    }

    var json = jsonDecode(response.body);
    return (json as List<dynamic>)
        .map((storyJson) => Story.fromJSON(storyJson))
        .toList();
  }
}
