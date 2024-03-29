import 'package:pawlog/src/model/model.dart';

class StartAuthenticationAction {
  @override
  String toString() => 'StartAuthenticationAction';
}

class FinishAuthenticationAction {
  final String userHash;
  final User user;

  FinishAuthenticationAction(
    this.userHash,
    this.user,
  );

  @override
  String toString() => 'FinishAuthenticationAction {hash: $userHash}';
}

class ThrowAuthenticationErrorAction {
  String error;

  ThrowAuthenticationErrorAction(this.error);

  @override
  String toString() => 'ThrowAuthenticationErrorAction {$error}';
}
