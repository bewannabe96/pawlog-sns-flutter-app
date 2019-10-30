import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/auth.dart';
import 'package:pawlog/ui/component/pl_filled_button.dart';

class FindPasswordScreen extends StatefulWidget {
  static const routeName = '/find-password';

  const FindPasswordScreen({Key key}) : super(key: key);

  @override
  _FindPasswordScreenState createState() => _FindPasswordScreenState();
}

class _FindPasswordScreenState extends State<FindPasswordScreen> {
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
                AuthTitleText(
                  'Forgot\nPassword?',
                  'We will send you a temporary password. '
                      'Please reset the password after login.',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AuthTextFormField(title: 'Email'),
                ),
                Expanded(child: Container()),
                PLFilledButton(title: 'Send Password'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
