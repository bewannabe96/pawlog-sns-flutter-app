import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/reducer/app_state_reducer.dart';

import 'package:pawlog/src/route_generator.dart';

class PawlogApp extends StatelessWidget {
  final Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: [thunkMiddleware],
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );

    return StoreProvider(
      store: _store,
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
