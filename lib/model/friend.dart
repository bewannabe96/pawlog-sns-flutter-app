import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/entity/entity.dart';

class Friend extends Equatable {
  final int userID;
  final String name;
  final String email;

  const Friend._({
    @required this.userID,
    @required this.name,
    @required this.email,
  });

  @override
  List<Object> get props => [userID];

  factory Friend.fromEntity(FriendEntity entity) {
    return Friend._(
      userID: entity.userID,
      name: entity.name,
      email: entity.email,
    );
  }
}
