import 'dart:async';

import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:bloc/bloc.dart';

import 'package:pawlog/repository/repository.dart';

import './bloc.dart';

class RegisterConfirmBloc
    extends Bloc<RegisterConfirmEvent, RegisterConfirmState> {
  @override
  RegisterConfirmState get initialState => RegisterConfirmIntial();

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
    yield RegisterConfirmProgress();

    if (event.verificationCode == '') {
      yield ConfirmFailure(
        generalError: 'Please enter the verification code.',
      );
      return;
    }

    try {
      await AuthRepository.confirmRegistration(
        event.email,
        event.verificationCode,
      );
      yield ConfirmSuccess();
    } on CognitoClientException catch (e) {
      switch (e.code) {
        case 'CodeMismatchException':
          yield ConfirmFailure(
            generalError: 'Verification code is not correct.',
          );
          break;
        default:
          yield ConfirmFailure(
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
