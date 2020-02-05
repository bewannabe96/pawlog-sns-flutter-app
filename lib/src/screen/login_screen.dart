import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/screen/register_confirm_screen.dart';
import 'package:pawlog/src/screen/register_screen.dart';
import 'package:pawlog/src/screen/forgot_password_screen.dart';

import 'package:pawlog/src/widget/auth_text_field.dart';
import 'package:pawlog/src/widget/auth_text_button.dart';
import 'package:pawlog/src/widget/filled_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _submitButtonEnabled = false;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) => setState(() {
        _keyboardVisible = visible;
      }),
    );

    _emailController.addListener(
      () => setState(() {
        _submitButtonEnabled = _emailController.text.length > 0 &&
            _passwordController.text.length > 0;
      }),
    );
    _passwordController.addListener(
      () => setState(() {
        _submitButtonEnabled = _emailController.text.length > 0 &&
            _passwordController.text.length > 0;
      }),
    );
  }

  void _logIn() {
    // TODO: implement logIn
  }

  void _navigateToRegisterConfirm() {
    Navigator.of(context).pushNamed(RegisterConfirmScreen.routeName);
  }

  void _navigateToRegister() {
    Navigator.of(context).pushNamed(RegisterScreen.routeName);
  }

  void _navigateToForgotPassword() {
    Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.4,
                  image: AssetImage('res/asset/logo_filled.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    AuthTextField(
                      label: 'Email',
                      controller: _emailController,
                    ),
                    AuthTextField(
                      label: 'Password',
                      isPassword: true,
                      controller: _passwordController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: PLFilledButton(
                  label: 'Login',
                  onPressed: _submitButtonEnabled ? _logIn : null,
                ),
              ),
              Visibility(
                visible: !_keyboardVisible,
                child: Column(
                  children: <Widget>[
                    AuthTextButton(
                      label: 'Forgot Password?',
                      onPressed: _navigateToForgotPassword,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AuthTextButton(
                        label: 'Create an Account',
                        onPressed: _navigateToRegister,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
