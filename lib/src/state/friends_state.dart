import 'package:equatable/equatable.dart';

import 'package:pawlog/src/model/model.dart';

class FriendsState extends Equatable {
  final List<Friend> friends;
  final bool loading;
  final String error;

  const FriendsState._({
    this.friends,
    this.loading,
    this.error,
  });

  @override
  List<Object> get props => friends.map((friend) => friend.userID).toList();

  FriendsState copyWith({
    List<Friend> friends,
    bool loading,
    String error,
  }) {
    return FriendsState._(
      friends: friends ?? this.friends,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  factory FriendsState.initialState() => FriendsState._(
        friends: const [],
        loading: false,
        error: null,
      );
}
