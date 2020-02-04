import 'package:pawlog/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';
import 'package:pawlog/src/model/model.dart';

class StoryRepository {
  static Future<List<Story>> loadStories(int page, int userID) async {
    List<StoryEntity> storyEntities;
    try {
      storyEntities = await StoryAPIClient.loadStories(page, userID);
    } catch (_) {}

    return storyEntities.map((entity) => Story.fromEntity(entity)).toList();
  }

  static Future<List<Comment>> loadComments(int storyID, int page) async {
    List<CommentEntity> commentEntities;
    try {
      commentEntities = await StoryAPIClient.fetchComments(storyID, page);
    } catch (_) {}

    return commentEntities.map((entity) => Comment.fromEntity(entity)).toList();
  }

  static Future<void> toggleStoryLike(
    int storyID,
    int userID,
    bool userLiked,
  ) async {
    await StoryAPIClient.likeUnlikeStory(
      storyID,
      userID,
      !userLiked,
    );
  }

  static Future<Comment> writeStoryComment(
    int storyID,
    int userID,
    String comment,
  ) async {
    final entity = await StoryAPIClient.writeComment(
      storyID,
      userID,
      comment,
    );

    return Comment.fromEntity(entity);
  }
}
