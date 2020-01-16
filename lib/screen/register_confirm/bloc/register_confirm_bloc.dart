import 'dart:async';

import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

import './bloc.dart';

class RegisterConfirmBloc
    extends Bloc<RegisterConfirmEvent, RegisterConfirmState> {
  @override
  RegisterConfirmState get initialState => InitialRegisterConfirmState();

  @override
  Stream<RegisterConfirmState> mapEventToState(
    RegisterConfirmEvent event,
  ) async* {
    if (event is ConfirmationCheckRequested) {
      yield* _mapConfirmationCheckRequestedToState(event);
    } else if (event is ResendCodeRequested) {
      yield* _mapResendCodeRequestedToState(event);
    }
  }

  Stream<RegisterConfirmState> _mapConfirmationCheckRequestedToState(
    ConfirmationCheckRequested event,
  ) async* {
    yield VerificationConfirming();

    if (event.verificationCode == '') {
      yield ConfirmationFailed(
        generalError: 'Please enter the verification code.',
      );
      return;
    }

    try {
      await AuthRepository.confirmRegistration(
        event.email,
        event.verificationCode,
      );
      yield Confirmed();
    } on CognitoClientException catch (e) {
      switch (e.code) {
        case 'CodeMismatchException':
          yield ConfirmationFailed(
            generalError: 'Verification code is not correct.',
          );
          break;
        default:
          yield ConfirmationFailed(
            generalError: 'Unknown Error',
          );
      }
    }
  }

  Stream<RegisterConfirmState> _mapResendCodeRequestedToState(
    ResendCodeRequested event,
  ) async* {
    await AuthRepository.resendConfirmCode(event.email);
  }
}
