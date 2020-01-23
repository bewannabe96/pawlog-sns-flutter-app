import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';
import 'package:meta/meta.dart';

class LoginManagerAction extends BlocAction {
  const LoginManagerAction();
}

class CheckLocalAuthentication extends LoginManagerAction {}

class AttemptLogin extends LoginManagerAction {
  final String email;
  final String password;

  const AttemptLogin({
    @required this.email,
    @required this.password,
  });
}
