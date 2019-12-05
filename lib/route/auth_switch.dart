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
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is AuthorizedState) {
          BlocProvider.of<FamilyBloc>(context).add(
            LoadFamilyEvent(state.user.userID),
          );
          BlocProvider.of<FriendBloc>(context).add(
            LoadFriendsEvent(state.user.userID),
          );
          BlocProvider.of<ChatBloc>(context).add(
            LoadChatsEvent(state.user.userID),
          );
          BlocProvider.of<ProfileBloc>(context).add(
            LoadProfileEvent(state.user.userID),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthorizedState) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
