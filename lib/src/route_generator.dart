import 'package:flutter/material.dart';

import 'package:pawlog/src/screen/login_screen.dart';
import 'package:pawlog/src/screen/register_screen.dart';
import 'package:pawlog/src/screen/register_confirm_screen.dart';
import 'package:pawlog/src/screen/forgot_password_screen.dart';

import 'package:pawlog/src/screen/home_screen.dart';

import 'package:pawlog/src/screen/story_detail_screen.dart';

import 'package:pawlog/src/screen/user_profile_screen.dart';

class RouteGenerator {
  static const initialRoute = '/';

  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case LoginScreen.routeName:
        builder = (_) => LoginScreen();
        break;
      case RegisterScreen.routeName:
        builder = (_) => RegisterScreen();
        break;
      case RegisterConfirmScreen.routeName:
        builder = (_) => RegisterConfirmScreen(settings.arguments);
        break;
      case ForgotPasswordScreen.routeName:
        builder = (_) => ForgotPasswordScreen();
        break;

      case HomeScreen.routeName:
        builder = (_) => HomeScreen();
        break;

      case StoryDetailScreen.routeName:
        builder = (_) => StoryDetailScreen(settings.arguments);
        break;

      case UserProfileScreen.routeName:
        builder = (_) => UserProfileScreen();
        break;
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
