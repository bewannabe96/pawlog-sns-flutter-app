import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:meta/meta.dart';

class CognitoUserEntity {
  final String hash;
  final String email;
  final String name;

  const CognitoUserEntity._({
    @required this.hash,
    @required this.email,
    @required this.name,
  });

  factory CognitoUserEntity.fromCognitoUserAttrs(
      List<CognitoUserAttribute> attrs) {
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

    return CognitoUserEntity._(
      hash: _hash,
      email: _eamil,
      name: _name,
    );
  }
}

class UserBaseEntity {
  final int userID;

  const UserBaseEntity({
    @required this.userID,
  });
}
