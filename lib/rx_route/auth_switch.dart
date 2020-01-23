import 'package:flutter/material.dart';
import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

import 'package:pawlog/manager/manager.dart';

import 'package:pawlog/rx_screen/login_screen.dart';
import 'package:pawlog/rx_screen/home_screen/screen.dart';

class AuthenticationSwitch extends StatelessWidget {
  static const routeName = '/';

  const AuthenticationSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authManager =
        BlocManagerClusterProvider.of(context).manager<AuthenticationManager>();

    BlocManagerClusterProvider.of(context).allotAction(
      CheckLocalAuthentication(),
    );

    return StateBuilder(
      stateContainer: authManager.stateContainer,
      buildOnState: (context, state) => HomeScreen(),
      buildOnDefault: (context) => LoginScreen(),
    );
  }
}
