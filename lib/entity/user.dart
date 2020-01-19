import 'package:amazon_cognito_identity_dart/cognito.dart';

class CognitoUserEntity {
  final String hash;

  const CognitoUserEntity._({
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

    return CognitoUserEntity._(
      hash: _hash,
    );
  }
}

class UserEntity {
  final int userID;
  final String email;
  final String name;
  final String imageURL;
  final String intro;

  const UserEntity._({
    this.userID,
    this.email,
    this.name,
    this.imageURL,
    this.intro,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity._(
      userID: json['userid'],
      email: json['email'],
      name: json['name'],
      imageURL: json['imageurl'],
      intro: json['intro'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['userid'] = userID;
    json['email'] = email;
    json['name'] = name;
    json['imageurl'] = imageURL;
    json['intro'] = intro;

    return json;
  }
}

class UserSearchResultEntity {
  final int userID;
  final String imageURL;
  final String name;
  final String intro;

  const UserSearchResultEntity._({
    this.userID,
    this.imageURL,
    this.name,
    this.intro,
  });

  factory UserSearchResultEntity.fromJson(Map<String, dynamic> json) {
    return UserSearchResultEntity._(
      userID: json['userid'],
      imageURL: json['imageurl'],
      name: json['name'],
      intro: json['intro'],
    );
  }
}
