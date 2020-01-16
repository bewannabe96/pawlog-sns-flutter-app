import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterConfirmEvent extends Equatable {
  const RegisterConfirmEvent();
}

class ConfirmationCheckRequested extends RegisterConfirmEvent {
  final String email;
  final String verificationCode;

  const ConfirmationCheckRequested({
    @required this.email,
    @required this.verificationCode,
  });

  @override
  List<Object> get props => [email, verificationCode];
}

class ResendCodeRequested extends RegisterConfirmEvent {
  final String email;

  const ResendCodeRequested({@required this.email});

  @override
  List<Object> get props => [email];
}
