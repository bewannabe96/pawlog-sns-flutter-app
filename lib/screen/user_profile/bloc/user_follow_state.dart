import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class UserFollowState extends Equatable {
  const UserFollowState();

  @override
  List<Object> get props => [];
}

class UserFollowInitial extends UserFollowState {}

class UserFollowActionProgress extends UserFollowState {}

class UserFollowActionSuccess extends UserFollowState {
  final bool follow;

  const UserFollowActionSuccess({
    @required this.follow,
  });

  @override
  List<Object> get props => [follow];
}

class UserFollowActionFailure extends UserFollowState {}
