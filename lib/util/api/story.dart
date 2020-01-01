import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/util/api/api.dart';

class StoryAPIClient extends PawlogAPIClient {
  static Future<List<StoryEntity>> loadStories(int page) async {
    throw ('not implemented');
  }

  static Future<List<StoryEntity>> loadUserStories(int userID) async {
    throw ('not implemented');
  }
}
