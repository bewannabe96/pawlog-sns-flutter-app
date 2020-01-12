import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/model/model.dart';
import 'package:pawlog/util/api/api.dart';

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

  static Future<void> writeStoryComment(
    int storyID,
    int userID,
    String comment,
  ) async {
    await StoryAPIClient.writeComment(storyID, userID, comment);
  }
}
