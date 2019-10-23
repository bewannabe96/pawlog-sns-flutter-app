import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                      image: AssetImage('res/asset/logo_outlined.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AuthTextFormField(title: 'Email'),
                    AuthTextFormField(title: 'Password'),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AuthButton(
                        title: 'Login',
                      ),
                    ),
                    AuthTextButton(title: 'Forgot Password?'),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AuthTextButton(title: 'Create an Account'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
