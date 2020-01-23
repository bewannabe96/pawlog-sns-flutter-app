import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:pawlog/rx_route/auth_switch.dart';

class RouteGenerator {
  static const initialRoute = AuthenticationSwitch.routeName;

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case AuthenticationSwitch.routeName:
        builder = (_) => AuthenticationSwitch();
        break;
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
