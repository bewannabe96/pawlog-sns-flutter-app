import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/screen/login_screen.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/thunk_action/auth_thunk_action.dart';

class LoginScreenContainer extends StatelessWidget {
  static const routeName = LoginScreen.routeName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, viewmodel) => LoginScreen(
        props: LoginScreenProps(
          authenticating: viewmodel.authenticating,
          signIn: viewmodel.onSignIn,
        ),
      ),
    );
  }
}

class _ViewModel {
  final bool authenticating;

  final Function(String, String) onSignIn;

  _ViewModel._({
    this.authenticating,
    this.onSignIn,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel._(
      authenticating: store.state.authState.processing,
      onSignIn: (String email, String password) =>
          store.dispatch(authenticateUser(email, password)),
    );
  }
}
