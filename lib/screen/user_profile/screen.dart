import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import './page.dart';

import 'package:pawlog/bloc/bloc.dart';

class UserProfileScreenArgs {
  final int userID;

  const UserProfileScreenArgs(this.userID);
}

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user-profile';

  final int userID;

  const UserProfileScreen(this.userID, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserProfileBloc>(
      create: (context) => UserProfileBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
      )..add(
          UserProfilePageLoaded(userID),
        ),
      child: UserProfilePage(),
    );
  }
}
