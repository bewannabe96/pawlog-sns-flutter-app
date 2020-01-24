import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class UserFollowState extends Equatable {
  const UserFollowState();

  @override
  List<Object> get props => [];
}

class UserFollowInitial extends UserFollowState {}

class UserFollowActionProgress extends UserFollowState {}

class UserFollowActionSuccess extends UserFollowState {
  final bool follow;
  final Friend friend;

  const UserFollowActionSuccess({
    @required this.follow,
    @required this.friend,
  });

  @override
  List<Object> get props => [follow, friend.userID];
}

class UserFollowActionFailure extends UserFollowState {}
