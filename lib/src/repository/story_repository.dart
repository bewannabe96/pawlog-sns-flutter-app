import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class StoryRepository {
  static Future<List<Story>> loadStories(int page, int userID) async {
    List<StoryEntity> storyEntities;

    storyEntities = await StoryAPIClient.loadStories(page, userID);

    return storyEntities.map((entity) => Story.fromEntity(entity)).toList();
  }

  static Future<List<Comment>> loadComments(int storyID, int page) async {
    List<CommentEntity> commentEntities;

    commentEntities = await StoryAPIClient.fetchComments(storyID, page);

    return commentEntities.map((entity) => Comment.fromEntity(entity)).toList();
  }

  static Future<void> likeStory(int storyID, int userID) async {
    await StoryAPIClient.likeStory(storyID, userID);
  }

  static Future<void> unlikeStory(int storyID, int userID) async {
    await StoryAPIClient.unlikeStory(storyID, userID);
  }

  static Future<Comment> writeStoryComment(
    int storyID,
    int userID,
    String comment,
  ) async {
    final entity = await StoryAPIClient.writeComment(storyID, userID, comment);

    return Comment.fromEntity(entity);
  }
}
