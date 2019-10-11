import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pawlog/login_screen.dart';
import 'package:pawlog/signup_screen.dart';
import 'package:pawlog/home_screen.dart';
import 'package:pawlog/profile_screen.dart';

void main() => runApp(PawlogApp());

class PawlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'PetMe',
      theme: ThemeData(
        // Colors
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
        // Fonts
        fontFamily: 'Arial',
        textTheme: TextTheme(),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext _) => LoginScreen(),
        '/signup': (BuildContext context) => _buildSignupNavigator(context),
        '/home': (BuildContext context) => HomeScreen(),
        '/profile': (BuildContext _) => ProfileScreen(),
      },
    );
  }

  Navigator _buildSignupNavigator(BuildContext context) {
    return Navigator(
      initialRoute: 'phone',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'email':
            builder = (BuildContext _) => SignupScreen(
                  signupStep: SignupSteps.Email,
                  isFirstStep: true,
                );
            break;
          case 'phone':
            builder = (BuildContext _) => SignupScreen(
                  signupStep: SignupSteps.Phone,
                  isLastStep: true,
                  onFinishSignup: () => Navigator.of(context).pop(),
                );
            break;
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
