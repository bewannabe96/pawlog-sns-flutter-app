import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/page/friend_page.dart';

import 'package:pawlog/src/state/app_state.dart';

class FriendPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FriendPageProps>(
      converter: (store) => _mapStateToProps(store),
      builder: (context, props) => FriendPage(props: props),
    );
  }
}

FriendPageProps _mapStateToProps(Store<AppState> store) {
  return FriendPageProps(
    friends: store.state.friendState.friendsState.friends,
  );
}
