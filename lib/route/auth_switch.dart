import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pawlog/provider/auth.dart';

import 'package:pawlog/ui/screen/auth/login_screen.dart';
import 'package:pawlog/ui/screen/home_screen.dart';

class AuthSwitch extends StatelessWidget {
  static const routeName = '/';

  const AuthSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<AuthProvider>(context).authState) {
      case AuthStates.Authorized:
        return HomeScreen();
      default:
        return LoginScreen();
    }
  }
}
