import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final userHash = await AuthRepository.checkAuthentication();
      if (userHash != null) {
        final user = await _userRepository.fetchUserInfo(userHash);
        yield Authenticated(user);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState(LoggedIn event) async* {
    try {
      final user = await _userRepository.fetchUserInfo(event.hash);
      yield Authenticated(user);
    } catch (_) {
      yield Unauthenticated();
    }
  }
}
