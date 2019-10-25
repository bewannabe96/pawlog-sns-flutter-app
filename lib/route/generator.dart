import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:pawlog/route/auth_switch.dart';

import 'package:pawlog/ui/screen/auth/find_password_screen.dart';
import 'package:pawlog/ui/screen/auth/register_screen.dart';

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
        builder = (BuildContext _) => AuthSwitch();
        break;

      case FindPasswordScreen.routeName:
        builder = (BuildContext _) => FindPasswordScreen();
        break;
      case RegisterScreen.routeName:
        builder = (BuildContext _) => RegisterScreen();
        break;

      case MeetupListScreen.routeName:
        builder = (BuildContext _) => MeetupListScreen();
        break;
      case MeetupMapScreen.routeName:
        builder = (BuildContext _) => MeetupMapScreen();
        break;

      case ProfileScreen.routeName:
        builder = (BuildContext _) => ProfileScreen();
        break;
      case ChatScreen.routeName:
        builder = (BuildContext _) => ChatScreen();
        break;
      case StoryDetailScreen.routeName:
        builder = (BuildContext _) => StoryDetailScreen();
        break;
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
