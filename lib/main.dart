import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawlog/bloc/bloc.dart';
import 'package:bloc/bloc.dart';

import 'package:pawlog/route/generator.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(PawlogApp());
}

// void main() => runApp(PawlogApp());

class PawlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return BlocProvider(
      builder: (BuildContext context) => AuthBloc(),
      child: MaterialApp(
        title: 'PetMe',
        theme: ThemeData(
          // Colors
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.amber,
          colorScheme: ColorScheme.light(
            primary: const Color(0xFFD8782E),
            primaryVariant: const Color(0xFF37261E),
            secondary: const Color(0xFFE1DCD9),
            secondaryVariant: const Color(0xFFB4A7A1),
            error: const Color(0xFFD85052),
          ),
          // Fonts
          fontFamily: 'Arial',
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Widgets
          splashColor: const Color(0x30B4A7A1),
          highlightColor: Colors.transparent,
        ),
        initialRoute: RouteGenerator.initialRoute,
        onGenerateRoute: RouteGenerator.generateMainRoute,
      ),
    );
  }
}
