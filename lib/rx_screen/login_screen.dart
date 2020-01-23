import 'package:flutter/material.dart';
import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:pawlog/manager/manager.dart';

import 'package:pawlog/rx_component/filled_button.dart';
import 'package:pawlog/rx_component/auth_text_button.dart';
import 'package:pawlog/rx_component/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _keyboardVisible = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _emailErrorMessage;
  String _passwordErrorMessage;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
    _emailController.addListener(() {
      setState(() {
        _emailErrorMessage = null;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _passwordErrorMessage = null;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    BlocManagerClusterProvider.of(context).allotAction(
      AttemptLogin(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
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
                _buildBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              AuthTextField(
                title: 'Email',
                controller: _emailController,
                errorText: _emailErrorMessage,
              ),
              AuthTextField(
                title: 'Password',
                isPassword: true,
                controller: _passwordController,
                errorText: _passwordErrorMessage,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: FilledButton(
                title: 'Login',
                onPressed: _signIn,
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
                // onPressed: () => Navigator.of(context)
                //     .pushNamed(FindPasswordScreen.routeName),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: AuthTextButton(
                  title: 'Create an Account',
                  // onPressed: () =>
                  //     Navigator.of(context).pushNamed(RegisterScreen.routeName),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
