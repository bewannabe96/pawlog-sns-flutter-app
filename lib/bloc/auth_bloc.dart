import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => UnauthorizedState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckAuthenticationEvent) {
      yield* checkAuthentication();
    } else if (event is AuthenticateEvent) {
      yield* authenticate(event);
    }
  }

  Stream<AuthState> checkAuthentication() async* {
    yield SignInProcessingState();

    try {
      final user = await AuthRepository.checkAuthentication();
      if (user != null) {
        yield AuthorizedState(user: user);
      } else {
        yield UnauthorizedState();
      }
    } catch (e) {}
  }

  Stream<AuthState> authenticate(AuthenticateEvent event) async* {
    yield SignInProcessingState();

    if (event.email == '') {
      yield SignInErrorState(SignInErrorTypes.EmptyEmail);
      return;
    } else if (event.password == '') {
      yield SignInErrorState(SignInErrorTypes.EmptyPassword);
      return;
    }

    try {
      final user =
          await AuthRepository.authenticate(event.email, event.password);
      yield AuthorizedState(user: user);
    } catch (e) {
      switch (e) {
        case 'UserNotFoundException':
          yield SignInErrorState(SignInErrorTypes.UserNotExist);
          break;
        case 'NotAuthorizedException':
          yield SignInErrorState(SignInErrorTypes.NotAuthorized);
          break;
        case 'UserNotConfirmedException':
          yield SignInErrorState(SignInErrorTypes.UserNotConfirmed);
          break;
        default:
          yield SignInErrorState(SignInErrorTypes.Unknwon);
      }
    }
  }
}
