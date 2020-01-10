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
    this.imageURL,
    this.intro,
  });

  factory User.fromEntity(UserEntity userEntity) {
    return User._(
      userID: userEntity.userID,
      email: userEntity.email,
      name: userEntity.name,
      intro: userEntity.intro,
    );
  }
}
