import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/auth.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                        padding: const EdgeInsets.only(bottom: 70),
                        child: AuthTitleText(
                          'Welcome!',
                          'Sign up and meet new dogs around you.',
                        ),
                      ),
                      AuthTextFormField(title: 'Name'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: AuthTextFormField(title: 'Email'),
                      ),
                      AuthTextFormField(title: 'Password'),
                      AuthTextFormField(title: 'Password Confirm'),
                    ],
                  ),
                ),
                AuthButton(title: 'Create an Account'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
