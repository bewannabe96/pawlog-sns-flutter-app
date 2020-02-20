import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/view/screen/login_screen.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/thunk_action/auth_thunk_action.dart';

class LoginScreenContainer extends StatelessWidget {
  static const routeName = LoginScreen.routeName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginScreenProps>(
      converter: (store) => _mapStateToProps(store),
      builder: (context, props) => LoginScreen(props: props),
    );
  }
}

LoginScreenProps _mapStateToProps(Store<AppState> store) {
  return LoginScreenProps(
    authenticating: store.state.authState.processing,
    signIn: (String email, String password) =>
        store.dispatch(authenticateUser(email, password)),
  );
}
