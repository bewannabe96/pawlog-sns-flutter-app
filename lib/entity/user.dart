import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:meta/meta.dart';

class UserEntity {
  final String hash;
  final String email;
  final String name;

  const UserEntity._({
    @required this.hash,
    @required this.email,
    @required this.name,
  });

  factory UserEntity.fromCognitoUserAttrs(List<CognitoUserAttribute> attrs) {
    var _hash, _eamil, _name;

    attrs.forEach((attr) {
      switch (attr.name) {
        case 'sub':
          _hash = attr.value;
          break;
        case 'email':
          _eamil = attr.value;
          break;
        case 'name':
          _name = attr.value;
          break;
      }
    });

    return UserEntity._(
      hash: _hash,
      email: _eamil,
      name: _name,
    );
  }
}

class UserInfoEntity {
  final int userID;

  const UserInfoEntity({
    @required this.userID,
  });
}
