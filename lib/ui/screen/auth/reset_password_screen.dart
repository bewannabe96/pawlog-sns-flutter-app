import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/auth/auth.dart';
import 'package:pawlog/ui/component/pl_filled_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '/auth/reset-password';

  const ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: AuthTitleText(
                          'Reset Password',
                          'Please set your new password.',
                        ),
                      ),
                      AuthTextFormField(title: 'New Password'),
                      AuthTextFormField(title: 'Confirm Password'),
                    ],
                  ),
                ),
                PLFilledButton(title: 'Reset Password'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
