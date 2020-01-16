import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';
import './page.dart';

class RegisterConfirmScreenArgs {
  final String email;

  const RegisterConfirmScreenArgs({this.email});
}

class RegisterConfirmScreen extends StatelessWidget {
  static const routeName = '/register-confirm';

  final String email;

  RegisterConfirmScreen(
    RegisterConfirmScreenArgs args, {
    Key key,
  })  : email = args.email,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterConfirmBloc>(
      create: (context) => RegisterConfirmBloc(),
      child: RegisterConfirmPage(email: email),
    );
  }
}
