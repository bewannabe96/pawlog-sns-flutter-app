import 'dart:convert';
import 'dart:io';

import 'package:pawlog/entity/entity.dart';
import 'package:pawlog/util/api/api.dart';

class StoryAPIClient extends PawlogAPIClient {
  static Future<List<StoryEntity>> loadStories(int page, int userID) async {
    final path = PawlogAPIClient.apiServerHost +
        '/story?page=$page&requestingUserID=$userID';

    final response = await PawlogAPIClient.client.get(path);

    if (response.statusCode != 200) {
      throw ('');
    }

    var json = jsonDecode(response.body);
    return (json['stories'] as List)
        .map((j) => StoryEntity.fromJson(j))
        .toList();
  }

  static Future<List<StoryEntity>> loadUserStories(int userID) async {
    final path = PawlogAPIClient.apiServerHost + '/story?page=1&userID=$userID';

    final response = await PawlogAPIClient.client.get(path);

    if (response.statusCode != 200) {
      throw ('');
    }

    var json = jsonDecode(response.body);
    return (json['stories'] as List)
        .map((j) => StoryEntity.fromJson(j))
        .toList();
  }

  static Future createStory(
    int userID,
    String content,
    List<File> images,
  ) async {
    final path = PawlogAPIClient.apiServerHost + '/story';

    final response = await PawlogAPIClient.client.put(
      path,
      body: jsonEncode({
        'owner': userID,
        'content': content,
        'imageurls': [],
      }),
    );

    if (response.statusCode != 201) {
      throw ('');
    }
  }

  static Future<CommentEntity> writeComment(
    int storyID,
    int userID,
    String comment,
  ) async {
    final path = PawlogAPIClient.apiServerHost + '/story/$storyID/comment';

    final response = await PawlogAPIClient.client.put(
      path,
      body: jsonEncode({
        'userid': userID,
        'comment': comment,
      }),
    );

    switch (response.statusCode) {
      case HttpStatus.created:
        var json = jsonDecode(response.body);
        return CommentEntity.fromJson(json);
      default:
        throw ('');
    }
  }

  static Future<List<CommentEntity>> fetchComments(
    int storyID,
    int page,
  ) async {
    final path =
        PawlogAPIClient.apiServerHost + '/story/$storyID/comment?page=$page';

    final response = await PawlogAPIClient.client.get(path);

    if (response.statusCode != 200) {
      throw ('');
    }

    var json = jsonDecode(response.body);
    return (json['comments'] as List)
        .map((j) => CommentEntity.fromJson(j))
        .toList();
  }

  static Future likeUnlikeStory(
    int storyID,
    int userID,
    bool like,
  ) async {
    final path =
        PawlogAPIClient.apiServerHost + '/story/$storyID/like?userID=$userID';

    final response = await PawlogAPIClient.client.post(
      path,
      body: jsonEncode({
        'like': like,
      }),
    );

    if (response.statusCode != 200) {
      throw ('');
    }
  }
}
