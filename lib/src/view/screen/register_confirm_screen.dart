import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/view/widget/auth_text_button.dart';
import 'package:pawlog/src/view/widget/auth_text_field.dart';
import 'package:pawlog/src/view/widget/auth_title.dart';
import 'package:pawlog/src/view/widget/filled_button.dart';

class RegisterConfirmScreenArgs {
  final String email;

  const RegisterConfirmScreenArgs({this.email});
}

class RegisterConfirmScreen extends StatefulWidget {
  static const routeName = '/register-confirm';

  final String email;

  RegisterConfirmScreen(
    RegisterConfirmScreenArgs args, {
    Key key,
  })  : email = args.email,
        super(key: key);

  @override
  _RegisterConfirmScreenState createState() => _RegisterConfirmScreenState();
}

class _RegisterConfirmScreenState extends State<RegisterConfirmScreen> {
  TextEditingController _verificationCodeController = TextEditingController();

  bool _submitButtonEnabled = false;

  String _errorMessage;

  @override
  void initState() {
    super.initState();

    _verificationCodeController.addListener(
      () => setState(() {
        _errorMessage = null;
        _submitButtonEnabled = _verificationCodeController.text.length > 0;
      }),
    );
  }

  void _confirmRegistration() {
    // TODO: needs implementation
    print('confirm register');
  }

  void _resendVerificationCode() {
    // TODO: needs implementation
    print('resend verification code');
  }

  @override
  void dispose() {
    _verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AuthTitle(title: 'Verification', displayBackButton: false),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(FontAwesomeIcons.envelope,
                        color: primaryColor),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Please type the verification code sent to',
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: AuthTextField(
                  label: 'Verification Code',
                  controller: _verificationCodeController,
                  errorText: _errorMessage,
                ),
              ),
              AuthTextButton(
                label: 'Resend Code',
                onPressed: _resendVerificationCode,
              ),
              Spacer(),
              PLFilledButton(
                label: 'Verify Email',
                onPressed: _submitButtonEnabled ? _confirmRegistration : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
