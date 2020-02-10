import 'package:flutter/material.dart';

import 'package:pawlog/src/auth_switch.dart';

import 'package:pawlog/src/presentation/screen/register_screen.dart';
import 'package:pawlog/src/presentation/screen/register_confirm_screen.dart';
import 'package:pawlog/src/presentation/screen/forgot_password_screen.dart';

import 'package:pawlog/src/presentation/screen/settings_screen.dart';
import 'package:pawlog/src/presentation/screen/edit_family_screen.dart';
import 'package:pawlog/src/presentation/screen/create_family_screen.dart';
import 'package:pawlog/src/presentation/screen/new_pet_screen.dart';

import 'package:pawlog/src/container/story_detail_screen_container.dart';
import 'package:pawlog/src/presentation/screen/new_story_screen.dart';

import 'package:pawlog/src/presentation/screen/user_profile_screen.dart';

import 'package:pawlog/src/presentation/screen/chat_screen.dart';

class RouteGenerator {
  static const initialRoute = AuthSwitch.routeName;

  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case AuthSwitch.routeName:
        builder = (_) => AuthSwitch();
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

      case SettingsScreen.routeName:
        builder = (_) => SettingsScreen();
        break;
      case EditFamilyScreen.routeName:
        builder = (_) => EditFamilyScreen();
        break;
      case CreateFamilyScreen.routeName:
        builder = (_) => CreateFamilyScreen();
        break;
      case NewPetScreen.routeName:
        builder = (_) => NewPetScreen();
        break;

      case StoryDetailScreenContainer.routeName:
        builder = (_) => StoryDetailScreenContainer(settings.arguments);
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
