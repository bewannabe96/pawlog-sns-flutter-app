import 'package:flutter/material.dart';

import 'package:pawlog/src/container/screen/home_screen.dart';
import 'package:pawlog/src/container/screen/login_screen.dart';

class AuthSwitch extends StatelessWidget {
  static const routeName = '/';

  const AuthSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return true ? HomeScreen() : LoginScreen();
  }
}
