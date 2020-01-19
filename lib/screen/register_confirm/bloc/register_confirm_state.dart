import 'package:equatable/equatable.dart';

abstract class RegisterConfirmState extends Equatable {
  const RegisterConfirmState();

  @override
  List<Object> get props => [];
}

class RegisterConfirmIntial extends RegisterConfirmState {}

class RegisterConfirmProgress extends RegisterConfirmState {}

class ConfirmSuccess extends RegisterConfirmState {}

class ConfirmFailure extends RegisterConfirmState {
  final String generalError;

  const ConfirmFailure({
    this.generalError,
  });

  @override
  List<Object> get props => [generalError];
}
