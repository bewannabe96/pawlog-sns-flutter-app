import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  @override
  FriendState get initialState => InitialFriendState();

  @override
  Stream<FriendState> mapEventToState(
    FriendEvent event,
  ) async* {
    if (event is LoadFriendsEvent) {
      yield* loadFriends(event);
    }
  }

  Stream<FriendState> loadFriends(LoadFriendsEvent event) async* {
    yield FriendsLoadingState();
    try {
      final friends = await UserRepository.fetchFriends(event.userID);
      yield FriendsLoadedState(friends: friends);
    } catch (e) {
      print(e);
      yield FriendErrorState();
    }
  }
}
