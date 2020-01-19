import 'dart:async';

import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

import './bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterSubmitted) {
      yield* _mapRegisterSubmittedToState(event);
    }
  }

  Stream<RegisterState> _mapRegisterSubmittedToState(
      RegisterSubmitted event) async* {
    yield RegisterProgress();

    if (event.email == '') {
      yield RegisterFailure(
        emailError: 'Email should not be empty.',
      );
      return;
    } else if (event.name == '') {
      yield RegisterFailure(
        nameError: 'Name should not be empty.',
      );
      return;
    } else if (event.password == '') {
      yield RegisterFailure(
        passwordError: 'Password cannot be empty.',
      );
      return;
    } else if (event.password.length < 8) {
      yield RegisterFailure(
        passwordError: 'Password is too short.',
      );
      return;
    } else if (!RegExp(r"[a-z]").hasMatch(event.password)) {
      yield RegisterFailure(
        passwordError: 'Password must contain lowercase characters.',
      );
      return;
    } else if (!RegExp(r"[A-Z]").hasMatch(event.password)) {
      yield RegisterFailure(
        passwordError: 'Password must contain uppercase characters.',
      );
      return;
    } else if (!RegExp(r"[0-9]").hasMatch(event.password)) {
      yield RegisterFailure(
        passwordError: 'Password must contain numeric character.',
      );
      return;
    } else if (event.password != event.passwordConfirm) {
      yield RegisterFailure(
        passwordConfirmError: 'Password does not match.',
      );
      return;
    }

    try {
      await AuthRepository.register(event.email, event.name, event.password);
      yield RegisterSuccess();
    } on CognitoClientException catch (e) {
      print(e);
      switch (e.code) {
        case 'UsernameExistsException':
          yield RegisterFailure(
            emailError: 'An account with the given email already exists.',
          );
          break;
        case 'InvalidParameterException':
          yield RegisterFailure(
            emailError: 'Invalid email address format.',
          );
          break;
        default:
          yield RegisterFailure(generalError: e.message);
      }
    }
  }
}
