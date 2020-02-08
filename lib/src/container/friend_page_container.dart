import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/page/friend_page.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/state/app_state.dart';

class FriendPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, viewmodel) => FriendPage(
        friends: viewmodel.friends,
      ),
    );
  }
}

class _ViewModel {
  final List<Friend> friends;

  _ViewModel._({
    this.friends,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel._(
      friends: store.state.friendState.friends.data,
    );
  }
}
