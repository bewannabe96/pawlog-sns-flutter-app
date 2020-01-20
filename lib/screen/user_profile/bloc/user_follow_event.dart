import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class UserFollowEvent extends Equatable {
  const UserFollowEvent();

  @override
  List<Object> get props => [];
}

class UserFollowRequested extends UserFollowEvent {
  final int targetUserID;
  final bool follow;

  const UserFollowRequested({
    @required this.targetUserID,
    @required this.follow,
  });
}
