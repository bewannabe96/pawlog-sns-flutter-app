import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/ui/screen/auth/login_screen.dart';
import 'package:pawlog/ui/screen/home_screen.dart';

class AuthSwitch extends StatelessWidget {
  static const routeName = '/';

  const AuthSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthorizedState) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
