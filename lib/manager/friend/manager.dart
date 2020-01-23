import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

import 'package:pawlog/manager/manager.dart';
import 'package:pawlog/model/model.dart';
import 'package:pawlog/repository/repository.dart';

import 'friend.dart';

class FriendManagerState {
  final List<Friend> friends;

  const FriendManagerState({
    this.friends,
  });
}

class FriendManager extends BlocManager<FriendManagerAction> {
  final stateContainer = StateContainer<FriendManagerState>();

  @override
  Future<void> performAction(FriendManagerAction action) async {
    if (action is LoadFriendsAction) {
      loadFriends();
    }
  }

  loadFriends() async {
    final authStateContainer =
        cluster.manager<AuthenticationManager>().stateContainer;

    if (authStateContainer.state.user != null) {
      final friends = await UserRepository.fetchFriends(
        authStateContainer.state.user.userID,
      );
      stateContainer.setState(
        FriendManagerState(
          friends: friends,
        ),
      );
    }
  }
}
