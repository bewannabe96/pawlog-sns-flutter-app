import 'dart:convert';
import 'dart:io';

import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';

class StoryAPIClient {
  static Future<List<StoryEntity>> loadStories(int page, int userID) async {
    final path = PawlogAPIClient.apiServerHost +
        '/story?page=$page&requestingUserID=$userID';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var json = jsonDecode(response.body);
        return (json['stories'] as List)
            .map((j) => StoryEntity.fromJson(j))
            .toList();
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<List<StoryEntity>> loadUserStories(
      int userID, int page, int requestingUserID) async {
    final path = PawlogAPIClient.apiServerHost +
        '/story?page=$page&userID=$userID&requestingUserID=$requestingUserID';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var json = jsonDecode(response.body);
        return (json['stories'] as List)
            .map((j) => StoryEntity.fromJson(j))
            .toList();
      default:
        throw ('Unexpected Status Code');
    }
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

    switch (response.statusCode) {
      case HttpStatus.created:
        return;
      default:
        throw ('Unexpected Status Code');
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
        throw ('Unexpected Status Code');
    }
  }

  static Future<List<CommentEntity>> fetchComments(
    int storyID,
    int page,
  ) async {
    final path =
        PawlogAPIClient.apiServerHost + '/story/$storyID/comment?page=$page';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var json = jsonDecode(response.body);
        return (json['comments'] as List)
            .map((j) => CommentEntity.fromJson(j))
            .toList();
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future likeStory(int storyID, int userID) async {
    final path =
        PawlogAPIClient.apiServerHost + '/story/$storyID/like?userID=$userID';

    final response = await PawlogAPIClient.client.post(
      path,
      body: jsonEncode({'like': true}),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return;
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future unlikeStory(int storyID, int userID) async {
    final path =
        PawlogAPIClient.apiServerHost + '/story/$storyID/like?userID=$userID';

    final response = await PawlogAPIClient.client.post(
      path,
      body: jsonEncode({'like': false}),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return;
      default:
        throw ('Unexpected Status Code');
    }
  }
}
