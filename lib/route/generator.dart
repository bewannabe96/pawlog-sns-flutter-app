import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/route/auth_switch.dart';

import 'package:pawlog/ui/screen/settings_screen.dart';
import 'package:pawlog/ui/screen/auth/find_password_screen.dart';
import 'package:pawlog/ui/screen/auth/register_screen.dart';
import 'package:pawlog/ui/screen/auth/confirmation_screen.dart';

import 'package:pawlog/ui/screen/meetup/list_screen.dart';
import 'package:pawlog/ui/screen/meetup/map_screen.dart';

import 'package:pawlog/ui/screen/user_profile_screen.dart';
import 'package:pawlog/ui/screen/chat_screen.dart';
import 'package:pawlog/ui/screen/story_detail_screen.dart';

import 'package:pawlog/ui/screen/family/create_family_screen.dart';

class RouteGenerator {
  static const initialRoute = AuthSwitch.routeName;

  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case AuthSwitch.routeName:
        builder = (_) => AuthSwitch();
        break;

      case SettingsScreen.routeName:
        builder = (_) => SettingsScreen();
        break;

      case FindPasswordScreen.routeName:
        builder = (_) => FindPasswordScreen();
        break;
      case RegisterScreen.routeName:
        builder = (_) => BlocProvider(
              builder: (context) => RegisterBloc(),
              child: RegisterScreen(),
            );
        break;
      case ConfirmationScreen.routeName:
        final ConfirmationScreenArgs args = settings.arguments;
        builder = (_) => BlocProvider(
              builder: (context) => RegisterBloc(),
              child: ConfirmationScreen(email: args.email),
            );
        break;

      case MeetupListScreen.routeName:
        builder = (_) => MeetupListScreen();
        break;
      case MeetupMapScreen.routeName:
        builder = (_) => MeetupMapScreen();
        break;

      case UserProfileScreen.routeName:
        final UserProfileScreenArgs args = settings.arguments;
        builder = (_) => UserProfileScreen(args.userID);
        break;
      case ChatScreen.routeName:
        builder = (_) => ChatScreen();
        break;
      case StoryDetailScreen.routeName:
        final StoryDetailScreenArgs args = settings.arguments;
        builder = (_) => StoryDetailScreen(args.story);
        break;

      case CreateFamilyScreen.routeName:
        builder = (_) => CreateFamilyScreen();
        break;
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
