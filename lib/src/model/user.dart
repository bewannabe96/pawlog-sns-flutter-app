import 'package:meta/meta.dart';

import 'package:pawlog/src/entity/entity.dart';

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
      userID: entity.userid,
      email: entity.email,
      name: entity.name,
      imageURL: entity.imageurl,
      intro: entity.intro,
    );
  }
}
