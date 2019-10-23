import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class SignupBloc extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  set email(String val) {
    _email = val;
    notifyListeners();
  }

  String get password => _password;
  set password(String val) {
    _password = val;
    notifyListeners();
  }

  Future<void> signup() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _email,
      password: _password,
    )
        .then((AuthResult result) {
      result.user.sendEmailVerification();
    }).catchError((onError) {});
  }

  @deprecated
  Future<void> sendSMSCode() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve =
        (String verificationId) {};

    final PhoneCodeSent smsCodeSent =
        (String verificationId, [int forceCodeResend]) {};

    final PhoneVerificationCompleted verifySucceed =
        (AuthCredential authCredential) {};

    final PhoneVerificationFailed verifyFailed = (AuthException error) {};

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: 'none',
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 30),
      codeAutoRetrievalTimeout: autoRetrieve,
      verificationCompleted: verifySucceed,
      verificationFailed: verifyFailed,
    );
  }
}
