import 'package:rxdart/rxdart.dart';
import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

import 'package:pawlog/manager/manager.dart';
import 'package:pawlog/repository/repository.dart';

import 'login.dart';

class LoginManager extends BlocManager<LoginManagerAction> {
  final _loginResultSubject = PublishSubject<String>();
  Sink<String> get _inLoginResult => _loginResultSubject.sink;

  @override
  Future<void> performAction(LoginManagerAction action) async {
    if (action is CheckLocalAuthentication) {
      checkAuthentication();
    } else if (action is AttemptLogin) {
      attemptLogin(action);
    }
  }

  checkAuthentication() async {
    try {
      final userHash = await AuthRepository.checkAuthentication();
      if (userHash != null) {
        final user = await UserRepository.fetchUserInfo(userHash);
        cluster.allotAction(
          Authenticate(user: user),
        );
      }
    } catch (_) {}
  }

  attemptLogin(AttemptLogin action) async {
    if (action.email == '') {
      // yield LoginFailure(emailError: 'Please type the email.');
      _inLoginResult.add('Please type the email.');
      return;
    } else if (action.password == '') {
      // yield LoginFailure(passwordError: 'Please type the password.');
      _inLoginResult.add('Please type the password.');
      return;
    }

    try {
      final userHash =
          await AuthRepository.authenticate(action.email, action.password);
      if (userHash != null) {
        final user = await UserRepository.fetchUserInfo(userHash);
        cluster.allotAction(
          Authenticate(user: user),
        );
      }
      _inLoginResult.add('success');
    } catch (e) {
      switch (e) {
        case 'UserNotFoundException':
          // yield LoginFailure(generalError: 'User does not exist.');
          _inLoginResult.add('User does not exist.');
          break;
        case 'NotAuthorizedException':
          // yield LoginFailure(generalError: 'Incorrect username or password.');
          _inLoginResult.add('Incorrect username or password.');
          break;
        case 'UserNotConfirmedException':
          // yield LoginFailure(userNotConfirmed: true);
          _inLoginResult.add('User not confirmed.');
          break;
        default:
          // yield LoginFailure(generalError: 'Unknown Error');
          _inLoginResult.add('Unknown Error.');
      }
    }
  }
}
