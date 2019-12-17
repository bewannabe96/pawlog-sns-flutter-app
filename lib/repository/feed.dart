import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/api/api.dart';

class FeedRepository {
  static Future<List<Story>> loadStories(int page) async {
    return await CombinedAPIClient.fetchStories(page);
  }
}
