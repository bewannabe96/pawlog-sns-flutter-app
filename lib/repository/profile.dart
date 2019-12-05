import 'package:pawlog/model/model.dart';

class ProfileRepository {
  static Future<UserProfile> fetchUserProfile(int userid) async {
    // return PawlogAPIClient.loadProfile(userid);
    return UserProfile();
  }

  static Future<List<Story>> fetchUserStories(int userid) async {
    // return PawlogAPIClient.loadProfileStories(userid);
    return [
      Story(
        storyID: 1,
        content: 'This is an image',
        updated: '',
        created: '',
      ),
      Story(
        storyID: 2,
        content: 'Awesome Day!!',
        updated: '',
        created: '',
      ),
      Story(
        storyID: 3,
        content: 'Good boy~',
        updated: '',
        created: '',
      ),
    ];
  }
}
