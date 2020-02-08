import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class FriendState extends Equatable {
  final _FriendsState friends;

  FriendState._({
    this.friends,
  });

  @override
  List<Object> get props => [friends];

  FriendState copyWith({
    _FriendsState friends,
  }) {
    return FriendState._(
      friends: friends ?? this.friends,
    );
  }

  factory FriendState.initialState() => FriendState._(
        friends: _FriendsState.initialState(),
      );
}

class _FriendsState extends Equatable {
  final List<Friend> data;
  final bool processing;
  final String error;

  const _FriendsState._({
    this.data,
    this.processing,
    this.error,
  });

  @override
  List<Object> get props => data.map((friend) => friend.userID).toList();

  _FriendsState copyWith({
    List<Friend> data,
    bool processing,
    String error,
  }) {
    return _FriendsState._(
      data: data ?? this.data,
      processing: processing ?? this.processing,
      error: error ?? this.error,
    );
  }

  factory _FriendsState.initialState() => _FriendsState._(
        data: const [],
        processing: false,
        error: null,
      );
}
