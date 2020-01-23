import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';
import 'package:meta/meta.dart';

import 'package:pawlog/model/model.dart';

class AuthenticationManagerAction extends BlocAction {
  const AuthenticationManagerAction();
}

class Authenticate extends AuthenticationManagerAction {
  final User user;

  Authenticate({@required this.user});
}
