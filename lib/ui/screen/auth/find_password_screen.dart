import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/auth.dart';

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
                          'Forgot\nPassword?',
                          'We will send you a temporary password. '
                              'Please reset the password after login.',
                        ),
                      ),
                      AuthTextFormField(title: 'Email'),
                    ],
                  ),
                ),
                AuthButton(title: 'Send Password'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
