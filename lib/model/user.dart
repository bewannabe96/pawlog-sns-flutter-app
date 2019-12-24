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
    CognitoUserEntity userBaseEntity,
    UserBaseEntity userEntity,
  }) {
    return User._(
      userID: userEntity.userID,
      hash: userBaseEntity.hash,
      email: userBaseEntity.email,
      name: userBaseEntity.name,
    );
  }
}
