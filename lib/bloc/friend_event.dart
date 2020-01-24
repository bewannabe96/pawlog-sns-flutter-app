import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();

  @override
  List<Object> get props => [];
}

class FriendPageLoaded extends FriendEvent {}

class FriendUpdated extends FriendEvent {
  final Friend friend;
  final bool add;

  const FriendUpdated({
    @required this.friend,
    @required this.add,
  });

  @override
  String toString() =>
      'FriendUpdated [${add ? 'ADD' : 'DEL'}: ${friend.email}]';
}
