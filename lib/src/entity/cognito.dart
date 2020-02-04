import 'package:amazon_cognito_identity_dart/cognito.dart';

class CognitoUserEntity {
  final String hash;

  const CognitoUserEntity({
    this.hash,
  });

  factory CognitoUserEntity.fromCognitoUserAttrs(
      List<CognitoUserAttribute> attrs) {
    var _hash;

    attrs.forEach((attr) {
      if (attr.name == 'sub') {
        _hash = attr.value;
      }
    });

    return CognitoUserEntity(
      hash: _hash,
    );
  }
}
