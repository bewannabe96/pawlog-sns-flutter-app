import 'package:equatable/equatable.dart';

abstract class RegisterConfirmState extends Equatable {
  const RegisterConfirmState();

  @override
  List<Object> get props => [];
}

class InitialRegisterConfirmState extends RegisterConfirmState {}

class VerificationConfirming extends RegisterConfirmState {}

class Confirmed extends RegisterConfirmState {}

class ConfirmationFailed extends RegisterConfirmState {
  final String generalError;

  const ConfirmationFailed({
    this.generalError,
  });

  @override
  List<Object> get props => [generalError];
}
