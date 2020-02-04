import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:pawlog/src/route_generator.dart';

import 'package:pawlog/src/store/store.dart';

class PawlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationStore>(
            create: (_) => AuthenticationStore()),
      ],
      child: MaterialApp(
        title: 'Pawlog',
        theme: _createTheme(),
        initialRoute: RouteGenerator.initialRoute,
        onGenerateRoute: RouteGenerator.generateMainRoute,
      ),
    );
  }

  ThemeData _createTheme() {
    return ThemeData(
      // Colors
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.amber,
      brightness: Brightness.light,
      // Fonts
      fontFamily: 'Arial',
      textTheme: TextTheme(
        title: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      // Widgets
      splashColor: const Color(0x30B4A7A1),
      highlightColor: Colors.transparent,
    );
  }
}
