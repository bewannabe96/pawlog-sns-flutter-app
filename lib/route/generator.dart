import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:pawlog/route/auth_switch.dart';

import 'package:pawlog/screen/register/screen.dart';
import 'package:pawlog/screen/register_confirm/screen.dart';
import 'package:pawlog/screen/story_view/screen.dart';
import 'package:pawlog/screen/user_profile/screen.dart';

import 'package:pawlog/ui/screen/auth/find_password_screen.dart';

import 'package:pawlog/ui/screen/meetup/list_screen.dart';
import 'package:pawlog/ui/screen/meetup/map_screen.dart';

import 'package:pawlog/ui/screen/story/new_story_screen.dart';

import 'package:pawlog/ui/screen/chat_screen.dart';

import 'package:pawlog/ui/screen/settings/settings_screen.dart';
import 'package:pawlog/ui/screen/settings/edit_family/edit_family_screen.dart';
import 'package:pawlog/ui/screen/settings/edit_family/create_family.dart';
import 'package:pawlog/ui/screen/settings/edit_family/new_pet_screen.dart';

import 'package:pawlog/ui/screen/util/breed_select_screen.dart';

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
        builder = (_) => RegisterScreen();
        break;
      case RegisterConfirmScreen.routeName:
        builder = (_) => RegisterConfirmScreen(settings.arguments);
        break;

      case MeetupListScreen.routeName:
        builder = (_) => MeetupListScreen();
        break;
      case MeetupMapScreen.routeName:
        builder = (_) => MeetupMapScreen();
        break;

      case NewStoryScreen.routeName:
        builder = (_) => NewStoryScreen();
        break;
      case StoryViewScreen.routeName:
        builder = (_) => StoryViewScreen(settings.arguments);
        break;

      case UserProfileScreen.routeName:
        builder = (_) => UserProfileScreen(settings.arguments);
        break;
      case ChatScreen.routeName:
        builder = (_) => ChatScreen();
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

      case BreedSelectScreen.routeName:
        builder = (_) => BreedSelectScreen();
        break;
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
