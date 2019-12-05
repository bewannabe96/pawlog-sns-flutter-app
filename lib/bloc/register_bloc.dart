import 'dart:async';

import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:bloc/bloc.dart';

import './bloc.dart';

import 'package:pawlog/repository/repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is NewRegisterEvent) {
      yield* register(
        event.email,
        event.name,
        event.password,
        event.passwordConfirm,
      );
    } else if (event is ConfirmRegistrationEvent) {
      yield* confirmRegistration(event.email, event.verificationCode);
    } else if (event is ResendConfirmCodeEvent) {
      yield* resendConfirmCode(event.email);
    }
  }

  Stream<RegisterState> register(
    String email,
    String name,
    String password,
    String passwordConfirm,
  ) async* {
    yield RegisterProcessingState();

    if (email == '') {
      yield RegisterErrorState(
        RegisterErrorTypes.EmailError,
        'Email should not be empty.',
      );
      return;
    } else if (name == '') {
      yield RegisterErrorState(
        RegisterErrorTypes.NameError,
        'Name should not be empty.',
      );
      return;
    } else if (password == '') {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password cannot be empty.',
      );
      return;
    } else if (password.length < 8) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password is too short.',
      );
      return;
    } else if (!RegExp(r"[a-z]").hasMatch(password)) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password must contain lowercase characters.',
      );
      return;
    } else if (!RegExp(r"[A-Z]").hasMatch(password)) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password must contain uppercase characters.',
      );
      return;
    } else if (!RegExp(r"[0-9]").hasMatch(password)) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password must contain numeric character.',
      );
      return;
    } else if (password != passwordConfirm) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordConfirmError,
        'Password does not match.',
      );
      return;
    }

    try {
      await AuthRepository.register(email, name, password);
      yield RegisterSucceedState();
    } on CognitoClientException catch (e) {
      print(e);
      switch (e.code) {
        case 'UsernameExistsException':
          yield RegisterErrorState(
            RegisterErrorTypes.EmailError,
            'An account with the given email already exists.',
          );
          break;
        case 'InvalidParameterException':
          yield RegisterErrorState(
            RegisterErrorTypes.EmailError,
            'Invalid email address format.',
          );
          break;
        default:
          yield RegisterErrorState(
            RegisterErrorTypes.Unknown,
            e.message,
          );
      }
    }
  }

  Stream<RegisterState> confirmRegistration(
    String email,
    String verificationCode,
  ) async* {
    yield VerificationProcessingState();

    if (verificationCode == '') {
      yield VerificationErrorState(VerificationErrorTypes.EmptyCode);
      return;
    }

    try {
      await AuthRepository.confirmRegistration(email, verificationCode);
      yield VerificationSucceedState();
    } on CognitoClientException catch (e) {
      switch (e.code) {
        case 'CodeMismatchException':
          yield VerificationErrorState(VerificationErrorTypes.MismatchCode);
          break;
        default:
          yield VerificationErrorState(VerificationErrorTypes.Unknown);
      }
    }
  }

  Stream<RegisterState> resendConfirmCode(String email) async* {
    await AuthRepository.resendConfirmCode(email);
  }
}
