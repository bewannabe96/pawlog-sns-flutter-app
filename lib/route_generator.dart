import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:pawlog/ui/screen/home_screen.dart';
import 'package:pawlog/ui/screen/profile_screen.dart';
import 'package:pawlog/ui/screen/chat_screen.dart';
import 'package:pawlog/ui/screen/story_detail_screen.dart';

class RouteGenerator {
  static const initialRoute = HomeScreen.routeName;

  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case HomeScreen.routeName:
        builder = (BuildContext _) => HomeScreen();
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
