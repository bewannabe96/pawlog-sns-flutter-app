import 'package:pawlog/model/model.dart';

import 'package:pawlog/util/pawlog_api_client.dart';

class ProfileRepository {
  static Future<Profile> fetchUserProfile(int userid) {
    return PawlogAPIClient.loadProfile(userid);
  }

  static Future<List<Story>> fetchUserProfileStories(int userid) {
    return PawlogAPIClient.loadProfileStories(userid);
  }
}
