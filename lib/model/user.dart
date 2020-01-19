import 'package:meta/meta.dart';

import 'package:pawlog/entity/entity.dart';

class User {
  final int userID;
  final String email;
  final String name;
  final String imageURL;
  final String intro;

  User._({
    @required this.userID,
    @required this.email,
    @required this.name,
    @required this.imageURL,
    @required this.intro,
  });

  factory User.fromEntity(UserEntity entity) {
    return User._(
      userID: entity.userID,
      email: entity.email,
      name: entity.name,
      imageURL: entity.imageURL,
      intro: entity.intro,
    );
  }
}

class UserSearchResult {
  final int userID;
  final String name;
  final String imageURL;
  final String intro;

  UserSearchResult._({
    @required this.userID,
    @required this.name,
    @required this.imageURL,
    @required this.intro,
  });

  factory UserSearchResult.fromEntity(UserSearchResultEntity entity) {
    return UserSearchResult._(
      userID: entity.userID,
      name: entity.name,
      imageURL: entity.imageURL,
      intro: entity.intro,
    );
  }
}
