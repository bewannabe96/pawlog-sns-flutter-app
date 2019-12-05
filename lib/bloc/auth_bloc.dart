import 'dart:async';

import 'package:amazon_cognito_identity_dart/cognito.dart';
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
    if (event is SignInEvent) {
      yield* signIn(event.email, event.password);
    }
  }

  Stream<AuthState> signIn(String email, String password) async* {
    yield SignInProcessingState();

    if (email == '') {
      yield SignInErrorState(SignInErrorTypes.EmptyEmail);
      return;
    } else if (password == '') {
      yield SignInErrorState(SignInErrorTypes.EmptyPassword);
      return;
    }

    try {
      final user = await AuthRepository.authenticate(email, password);
      yield AuthorizedState(user: user);
    } on CognitoClientException catch (e) {
      switch (e.code) {
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
