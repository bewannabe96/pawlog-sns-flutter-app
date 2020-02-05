import 'package:flutter/material.dart';

import 'package:pawlog/src/screen/home_screen.dart';
import 'package:pawlog/src/screen/login_screen.dart';

class AuthSwitch extends StatelessWidget {
  static const routeName = '/';

  const AuthSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return true ? HomeScreen() : LoginScreen();
  }
}
