import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/src/entity/entity.dart';

class Friend extends Equatable {
  final int userID;
  final String name;
  final String email;
  final String imageURL;

  const Friend._({
    @required this.userID,
    @required this.name,
    @required this.email,
    @required this.imageURL,
  });

  @override
  List<Object> get props => [userID];

  factory Friend.fromEntity(FriendEntity entity) {
    return Friend._(
      userID: entity.userid,
      name: entity.name,
      email: entity.email,
      imageURL: entity.imageurl,
    );
  }
}
