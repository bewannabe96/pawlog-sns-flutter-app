import 'package:meta/meta.dart';

class UserEntity {
  final String hash;
  final String email;
  final String name;

  const UserEntity({
    @required this.hash,
    @required this.email,
    @required this.name,
  });
}

class UserInfoEntity {
  final int userID;

  const UserInfoEntity({
    @required this.userID,
  });
}
