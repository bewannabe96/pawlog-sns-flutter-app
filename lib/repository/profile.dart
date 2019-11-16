import 'package:pawlog/model/profile.dart';

import 'package:pawlog/util/pawlog_api_client.dart';

class ProfileRepository {
  static Future<Profile> fetchUserProfile(int userid) async {
    return await PawlogAPIClient.loadProfile(userid);
  }
}
