import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/repository/repository.dart';

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
  runApp(RepositoryProvider(
    create: (context) => UserRepository(),
    child: BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) => AuthenticationBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      )..add(AppStarted()),
      child: PawlogApp(),
    ),
  ));
}

// void main() => runApp(PawlogApp());

class PawlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<SyncConfigBloc>(
          create: (BuildContext context) =>
              SyncConfigBloc()..add(LoadSyncConfigEvent()),
        ),
        BlocProvider<FriendBloc>(
          create: (BuildContext context) => FriendBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          )..add(FriendPageLoaded()),
        ),
        BlocProvider<FamilyBloc>(
          create: (BuildContext context) => FamilyBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          ),
        ),
      ],
      child: _buildAppWidget(),
    );
  }

  MaterialApp _buildAppWidget() {
    return MaterialApp(
      title: 'Pawlog',
      theme: _createTheme(),
      initialRoute: RouteGenerator.initialRoute,
      onGenerateRoute: RouteGenerator.generateMainRoute,
    );
  }

  ThemeData _createTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.orange,
      colorScheme: ColorScheme.light(
        primary: const Color(0xFFD8782E),
        primaryVariant: const Color(0xFF37261E),
        secondary: const Color(0xFFE1DCD9),
        secondaryVariant: const Color(0xFFB4A7A1),
        error: const Color(0xFFD85052),
      ),
      fontFamily: 'Arial',
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      splashColor: const Color(0x30B4A7A1),
      highlightColor: Colors.transparent,
    );
  }
}
