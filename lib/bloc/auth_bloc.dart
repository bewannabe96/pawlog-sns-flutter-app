import 'package:flutter/widgets.dart';

enum AuthStates {
  LoggedIn,
  LoggedOut,
}

class AuthBloc extends ChangeNotifier {
  AuthStates _authState = AuthStates.LoggedOut;

  AuthStates get authState => _authState;
}
