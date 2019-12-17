import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/api/api.dart';

class CombinedAPIClient extends PawlogAPIClient {
  static Future<List<Friend>> fetchUserFriends(int userid) async {
    return [
      Friend(userID: 1, name: 'Kate', email: 'katekim@naver.com'),
      Friend(userID: 2, name: 'John', email: 'john@naver.com'),
      Friend(userID: 3, name: 'William', email: 'will@naver.com'),
      Friend(userID: 4, name: 'Charlie', email: 'charlie@naver.com'),
    ];
  }

  static Future<List<Chat>> fetchUserChat(int userid) async {
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

  static Future<Profile> fetchProfile(int userid) async {
    var path = PawlogAPIClient.apiServerHost + '/profile/$userid';

    final response = await PawlogAPIClient.client.get(path);

    if (response.statusCode != 200) {
      throw Exception('error getting profile');
    }

    // var json = jsonDecode(response.body);
    return UserProfile(name: 'Test Name');
  }

  static Future<List<Story>> fetchProfileStories(int userid) async {
    var path = PawlogAPIClient.apiServerHost + '/story/user/$userid';

    final response = await PawlogAPIClient.client.get(path);

    if (response.statusCode != 200) {
      throw Exception('error getting profile stories');
    }

    // var json = jsonDecode(response.body);
    return [];
  }

  static Future<List<Story>> fetchStories(int page) async {
    List<Story> rtnStories = [];
    for (int i = 0; i < 10; i++) {
      rtnStories.add(Story(
        storyID: page * 10 + i + 1,
        content: 'Story' + (page * 10 + i + 1).toString(),
        created: '',
        updated: '',
      ));
    }
    return rtnStories;
  }
}
