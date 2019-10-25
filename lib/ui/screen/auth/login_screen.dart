import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:pawlog/ui/component/pl_primary_action_button.dart';
import 'package:provider/provider.dart';

import 'package:pawlog/provider/auth.dart';

import 'package:pawlog/ui/component/auth.dart';
import 'package:pawlog/ui/screen/auth/find_password_screen.dart';
import 'package:pawlog/ui/screen/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(
          () {
            _keyboardVisible = visible;
          },
        );
      },
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                      image: AssetImage('res/asset/logo_filled.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AuthTextFormField(title: 'Email'),
                    AuthTextFormField(title: 'Password', isPassword: true),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: PLPrimaryActionButton(
                        onPressed: () =>
                            Provider.of<AuthProvider>(context).signIn(),
                        title: 'Login',
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: !_keyboardVisible,
                  child: Column(
                    children: <Widget>[
                      AuthTextButton(
                        title: 'Forgot Password?',
                        onPressed: () => Navigator.of(context)
                            .pushNamed(FindPasswordScreen.routeName),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: AuthTextButton(
                          title: 'Create an Account',
                          onPressed: () => Navigator.of(context)
                              .pushNamed(RegisterScreen.routeName),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
