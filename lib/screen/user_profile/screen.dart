import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import './bloc/bloc.dart';

import './page.dart';

class UserProfileScreenArgs {
  final int userID;

  const UserProfileScreenArgs({
    @required this.userID,
  });
}

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user-profile';

  final int userID;

  UserProfileScreen(UserProfileScreenArgs args, {Key key})
      : userID = args.userID,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserProfileBloc>(
          create: (context) => UserProfileBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          )..add(UserProfilePageLoaded(userID: userID)),
        ),
        BlocProvider<UserFollowBloc>(
          create: (context) => UserFollowBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          ),
        ),
      ],
      child: UserProfilePage(),
    );
  }
}
