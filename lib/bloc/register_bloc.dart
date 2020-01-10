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
      yield* register(event);
    } else if (event is ConfirmRegistrationEvent) {
      yield* confirmRegistration(event);
    } else if (event is ResendConfirmCodeEvent) {
      yield* resendConfirmCode(event);
    }
  }

  Stream<RegisterState> register(
    NewRegisterEvent event,
  ) async* {
    yield RegisterProcessingState();

    if (event.email == '') {
      yield RegisterErrorState(
        RegisterErrorTypes.EmailError,
        'Email should not be empty.',
      );
      return;
    } else if (event.name == '') {
      yield RegisterErrorState(
        RegisterErrorTypes.NameError,
        'Name should not be empty.',
      );
      return;
    } else if (event.password == '') {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password cannot be empty.',
      );
      return;
    } else if (event.password.length < 8) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password is too short.',
      );
      return;
    } else if (!RegExp(r"[a-z]").hasMatch(event.password)) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password must contain lowercase characters.',
      );
      return;
    } else if (!RegExp(r"[A-Z]").hasMatch(event.password)) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password must contain uppercase characters.',
      );
      return;
    } else if (!RegExp(r"[0-9]").hasMatch(event.password)) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordError,
        'Password must contain numeric character.',
      );
      return;
    } else if (event.password != event.passwordConfirm) {
      yield RegisterErrorState(
        RegisterErrorTypes.PasswordConfirmError,
        'Password does not match.',
      );
      return;
    }

    try {
      await AuthRepository.register(event.email, event.name, event.password);
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
      ConfirmRegistrationEvent event) async* {
    yield VerificationProcessingState();

    if (event.verificationCode == '') {
      yield VerificationErrorState(VerificationErrorTypes.EmptyCode);
      return;
    }

    try {
      await AuthRepository.confirmRegistration(
          event.email, event.verificationCode);
      yield VerificationSucceedState();
    } on CognitoClientException catch (e) {
      print(e);
      switch (e.code) {
        case 'CodeMismatchException':
          yield VerificationErrorState(VerificationErrorTypes.MismatchCode);
          break;
        default:
          yield VerificationErrorState(VerificationErrorTypes.Unknown);
      }
    }
  }

  Stream<RegisterState> resendConfirmCode(ResendConfirmCodeEvent event) async* {
    await AuthRepository.resendConfirmCode(event.email);
  }
}
