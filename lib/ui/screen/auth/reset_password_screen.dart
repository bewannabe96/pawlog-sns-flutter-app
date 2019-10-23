import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '/reset-password';

  const ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
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
                AuthButton(title: 'Reset Password'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
