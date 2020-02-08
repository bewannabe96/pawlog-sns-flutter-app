import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/page/profile_page.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/state/app_state.dart';

class ProfilePageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, viewmodel) => ProfilePage(
        user: viewmodel.user,
      ),
    );
  }
}

class _ViewModel {
  final User user;

  _ViewModel._({
    this.user,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel._(
      user: store.state.authState.user,
    );
  }
}
