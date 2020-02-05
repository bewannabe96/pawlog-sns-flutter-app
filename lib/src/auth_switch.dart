import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/presentation/screen/home_screen.dart';
import 'package:pawlog/src/container/login_screen_container.dart';

class AuthSwitch extends StatelessWidget {
  static const routeName = '/';

  const AuthSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, viewmodel) =>
          viewmodel.isSignedIn ? HomeScreen() : LoginScreenContainer(),
    );
  }
}

class _ViewModel {
  final bool isSignedIn;

  _ViewModel({
    this.isSignedIn,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      isSignedIn: store.state.authState.isSignedIn,
    );
  }
}
