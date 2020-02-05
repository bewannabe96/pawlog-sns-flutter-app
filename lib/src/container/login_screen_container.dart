import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/screen/login_screen.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/action/auth_action.dart';

class LoginScreenContainer extends StatelessWidget {
  static const routeName = LoginScreen.routeName;

  const LoginScreenContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, viewmodel) => LoginScreen(
        props: LoginScreenProps(
          signIn: viewmodel.onSignIn,
        ),
      ),
    );
  }
}

class _ViewModel {
  final Function onSignIn;

  _ViewModel({
    this.onSignIn,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _onSignIn(String email, String password) {
      store.dispatch(SignInAction(email: email, password: password));
    }

    return _ViewModel(
      onSignIn: _onSignIn,
    );
  }
}
