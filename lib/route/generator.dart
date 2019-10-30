import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:pawlog/route/auth_switch.dart';

import 'package:pawlog/provider/register.dart';

import 'package:pawlog/ui/screen/auth/find_password_screen.dart';
import 'package:pawlog/ui/screen/auth/register_screen.dart';
import 'package:pawlog/ui/screen/auth/confirmation_screen.dart';

import 'package:pawlog/ui/screen/meetup/list_screen.dart';
import 'package:pawlog/ui/screen/meetup/map_screen.dart';

import 'package:pawlog/ui/screen/profile_screen.dart';
import 'package:pawlog/ui/screen/chat_screen.dart';
import 'package:pawlog/ui/screen/story_detail_screen.dart';

class RouteGenerator {
  static const initialRoute = AuthSwitch.routeName;

  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case AuthSwitch.routeName:
        builder = (_) => AuthSwitch();
        break;

      case FindPasswordScreen.routeName:
        builder = (_) => FindPasswordScreen();
        break;
      case RegisterScreen.routeName:
        builder = (_) => ChangeNotifierProvider(
              builder: (_) => RegisterProvider(),
              child: RegisterScreen(),
            );
        break;
      case ConfirmationScreen.routeName:
        final ConfirmationScreenArgs args = settings.arguments;
        builder = (_) => ChangeNotifierProvider(
              builder: (_) => RegisterProvider(),
              child: ConfirmationScreen(email: args.email),
            );
        break;

      case MeetupListScreen.routeName:
        builder = (_) => MeetupListScreen();
        break;
      case MeetupMapScreen.routeName:
        builder = (_) => MeetupMapScreen();
        break;

      case ProfileScreen.routeName:
        builder = (_) => ProfileScreen();
        break;
      case ChatScreen.routeName:
        builder = (_) => ChatScreen();
        break;
      case StoryDetailScreen.routeName:
        builder = (_) => StoryDetailScreen();
        break;
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
