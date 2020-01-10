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
      final userHash = await AuthRepository.checkAuthentication();
      if (userHash != null) {
        final user = await UserRepository.fetchUserInfo(userHash);
        yield AuthorizedState(userHash: userHash, user: user);
      } else {
        yield UnauthorizedState();
      }
    } catch (e) {
      print(e);
      yield UnauthorizedState();
    }
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
      final userHash =
          await AuthRepository.authenticate(event.email, event.password);
      if (userHash != null) {
        final user = await UserRepository.fetchUserInfo(userHash);
        yield AuthorizedState(userHash: userHash, user: user);
      } else {
        yield UnauthorizedState();
      }
    } catch (e) {
      print(e);
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
