import 'dart:convert';
import 'dart:io';

import 'package:pawlog/src/util/api/api.dart';

import 'package:pawlog/src/entity/entity.dart';

class UserAPIClient {
  static Future<UserEntity> fetchUserInfo(String userHash) async {
    final path = PawlogAPIClient.apiServerHost + '/user?userHash=$userHash';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return UserEntity.fromJson(jsonDecode(response.body));
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<FamilyEntity> fetchFamily(int userID) async {
    final path = PawlogAPIClient.apiServerHost + '/user/$userID/family';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return FamilyEntity.fromJson(jsonDecode(response.body));
      case HttpStatus.notFound:
        return null;
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<FamilyEntity> createFamily(
    int userID,
    String name,
  ) async {
    final path = PawlogAPIClient.apiServerHost + '/user/$userID/family';

    final response = await PawlogAPIClient.client.put(
      path,
      body: jsonEncode({
        'name': name,
      }),
    );

    switch (response.statusCode) {
      case HttpStatus.created:
        return FamilyEntity.fromJson(jsonDecode(response.body));
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<PetEntity> registerPet(
    int userID,
    String name,
    int breed,
    File image,
  ) async {
    final path = PawlogAPIClient.apiServerHost + '/user/$userID/family/pet';

    final response = await PawlogAPIClient.client.put(
      path,
      body: jsonEncode({
        'name': name,
        'breed': breed,
      }),
    );

    switch (response.statusCode) {
      case HttpStatus.created:
        return PetEntity.fromJson(jsonDecode(response.body));
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<List<FriendEntity>> fetchFriends(int userID) async {
    final path = PawlogAPIClient.apiServerHost + '/user/$userID/friends';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var json = jsonDecode(response.body);
        return (json['friends'] as List)
            .map((j) => FriendEntity.fromJson(j))
            .toList();
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<List<ChatHeaderEntity>> fetchChatHeaders(int userID) async {
    final path = PawlogAPIClient.apiServerHost + '/user/$userID/chat';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var json = jsonDecode(response.body);
        return (json['chatheaders'] as List)
            .map((j) => ChatHeaderEntity.fromJson(j))
            .toList();
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<ProfileEntity> fetchUserProfile(
    int userID,
    int requestingUserID,
  ) async {
    final path = PawlogAPIClient.apiServerHost +
        '/user/$userID/profile?requestingUserID=$requestingUserID';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return ProfileEntity.fromJson(jsonDecode(response.body));
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<UserSearchResultEntity> searchUserByEmail(String email) async {
    final path = PawlogAPIClient.apiServerHost + '/user/search?email=$email';

    final response = await PawlogAPIClient.client.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var json = jsonDecode(response.body);
        return UserSearchResultEntity.fromJson(json);
      case HttpStatus.notFound:
        return null;
      default:
        throw ('Unexpected Status Code');
    }
  }

  static Future<FriendEntity> followUser(
    int actionUserID,
    int targetUserID,
    bool follow,
  ) async {
    final path = PawlogAPIClient.apiServerHost +
        '/user/$actionUserID/follow/$targetUserID';

    final response = follow
        ? await PawlogAPIClient.client.put(path)
        : await PawlogAPIClient.client.delete(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var json = jsonDecode(response.body);
        return FriendEntity.fromJson(json);
      default:
        throw ('Unexpected Status Code');
    }
  }
}
