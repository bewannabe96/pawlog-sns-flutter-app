import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/api/api.dart';

class StoryRepository {
  static Future<List<Story>> loadStories(int page) async {
    List<StoryEntity> storyEntities;
    try {
      storyEntities = await StoryAPIClient.loadStories(page);
      // UserLocalStorage.writeUserInfo(userEntity);
    } catch (_) {
      // userEntity = await UserLocalStorage.readUserInfo();
    }

    return storyEntities.map((entity) => Story.fromEntity(entity)).toList();
  }
}
