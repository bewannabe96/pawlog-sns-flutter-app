import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

import 'package:pawlog/model/model.dart';

import 'authentication.dart';

class AuthenticationManagerState {
  final User user;

  const AuthenticationManagerState({
    this.user,
  });
}

class AuthenticationManager extends BlocManager<AuthenticationManagerAction> {
  final stateContainer = StateContainer<AuthenticationManagerState>();

  @override
  Future<void> performAction(AuthenticationManagerAction action) async {
    if (action is Authenticate) {
      authenticate(action);
    }
  }

  authenticate(Authenticate action) async {
    stateContainer.setState(
      AuthenticationManagerState(
        user: action.user,
      ),
    );
  }
}
