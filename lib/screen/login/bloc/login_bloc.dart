import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;

  LoginBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event);
    }
  }

  Stream<LoginState> _mapLoginSubmittedToState(LoginSubmitted event) async* {
    yield LoginLoading();

    if (event.email == '') {
      yield LoginFailed(emailError: 'Please type the email.');
      return;
    } else if (event.password == '') {
      yield LoginFailed(passwordError: 'Please type the password.');
      return;
    }

    try {
      final userHash =
          await AuthRepository.authenticate(event.email, event.password);
      if (userHash != null) {
        _authenticationBloc.add(LoggedIn(hash: userHash));
      }
      yield InitialLoginState();
    } catch (e) {
      switch (e) {
        case 'UserNotFoundException':
          yield LoginFailed(generalError: 'User does not exist.');
          break;
        case 'NotAuthorizedException':
          yield LoginFailed(generalError: 'Incorrect username or password.');
          break;
        case 'UserNotConfirmedException':
          yield LoginFailed(userNotConfirmed: true);
          break;
        default:
          yield LoginFailed(generalError: 'Unknown Error');
      }
    }
  }
}
