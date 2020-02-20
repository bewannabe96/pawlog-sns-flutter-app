import 'package:flutter/material.dart';

import 'package:pawlog/src/view/widget/auth_text_field.dart';
import 'package:pawlog/src/view/widget/auth_title.dart';
import 'package:pawlog/src/view/widget/filled_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password';

  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreen createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool _submitButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(
      () => setState(() {
        _submitButtonEnabled = _emailController.text.length > 0;
      }),
    );
  }

  void _sendPassword() {
    // TODO: needs implementation
    print('send password');
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              AuthTitle(
                title: 'Forgot\nPassword?',
                description: 'We will send you a temporary password. '
                    'Please reset the password after login.',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AuthTextField(
                  label: 'Email',
                  controller: _emailController,
                ),
              ),
              Spacer(),
              PLFilledButton(
                label: 'Send Password',
                onPressed: _submitButtonEnabled ? _sendPassword : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
