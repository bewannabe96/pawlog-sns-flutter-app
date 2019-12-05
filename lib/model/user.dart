import 'package:meta/meta.dart';

import 'package:pawlog/entity/entity.dart';

class User {
  final int userID;
  final String hash;
  final String email;
  final String name;

  final String profileURL;

  User._({
    @required this.userID,
    @required this.hash,
    @required this.email,
    @required this.name,
    this.profileURL,
  });

  factory User.fromEntity({
    UserEntity userEntity,
    UserInfoEntity userInfoEntity,
  }) {
    return User._(
      userID: userInfoEntity.userID,
      hash: userEntity.hash,
      email: userEntity.email,
      name: userEntity.name,
    );
  }
}
