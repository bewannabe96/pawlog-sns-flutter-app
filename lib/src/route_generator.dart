import 'package:flutter/material.dart';

import 'package:pawlog/src/screen/login_screen.dart';
import 'package:pawlog/src/screen/register_screen.dart';
import 'package:pawlog/src/screen/register_confirm_screen.dart';
import 'package:pawlog/src/screen/forgot_password_screen.dart';

import 'package:pawlog/src/screen/home_screen.dart';

import 'package:pawlog/src/screen/settings_screen.dart';
import 'package:pawlog/src/screen/edit_family_screen.dart';
import 'package:pawlog/src/screen/create_family_screen.dart';

import 'package:pawlog/src/screen/story_detail_screen.dart';
import 'package:pawlog/src/screen/new_story_screen.dart';

import 'package:pawlog/src/screen/user_profile_screen.dart';

import 'package:pawlog/src/screen/chat_screen.dart';

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

      case SettingsScreen.routeName:
        builder = (_) => SettingsScreen();
        break;
      case EditFamilyScreen.routeName:
        builder = (_) => EditFamilyScreen();
        break;
      case CreateFamilyScreen.routeName:
        builder = (_) => CreateFamilyScreen();
        break;

      case StoryDetailScreen.routeName:
        builder = (_) => StoryDetailScreen(settings.arguments);
        break;
      case NewStoryScreen.routeName:
        builder = (_) => NewStoryScreen();
        break;

      case UserProfileScreen.routeName:
        builder = (_) => UserProfileScreen();
        break;

      case ChatScreen.routeName:
        builder = (_) => ChatScreen();
        break;
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
