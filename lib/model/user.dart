import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String hash;
  final String email;
  final String name;

  User({
    this.hash,
    this.email,
    this.name,
  });

  @override
  List<Object> get props => [email];

  static User fromCognitoUserAttribute(List<CognitoUserAttribute> attrs) {
    String hash;
    String email;
    String name;

    attrs.forEach((attr) {
      switch (attr.name) {
        case 'sub':
          hash = attr.value;
          break;
        case 'email':
          email = attr.value;
          break;
        case 'name':
          name = attr.value;
          break;
      }
    });

    return User(
      hash: hash,
      email: email,
      name: name,
    );
  }
}
