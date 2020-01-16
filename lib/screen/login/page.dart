import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import './bloc/bloc.dart';

import 'package:pawlog/screen/register/screen.dart';
import 'package:pawlog/screen/register_confirm/screen.dart';

import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/component/auth/auth.dart';
import 'package:pawlog/ui/component/pl_filled_button.dart';
import 'package:pawlog/ui/screen/auth/find_password_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;

  bool _keyboardVisible = false;

  TextEditingController _emailController;
  TextEditingController _passwordController;

  String _emailErrorMessage;
  String _passwordErrorMessage;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

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
    _loginBloc.add(
      LoginSubmitted(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is LoginFailed) {
            if (state.emailError != null) {
              setState(() {
                _emailErrorMessage = state.emailError;
              });
            }
            if (state.passwordError != null) {
              setState(() {
                _passwordErrorMessage = state.passwordError;
              });
            }
            if (state.generalError != null) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(state.generalError), Icon(Icons.error)],
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
            } else if (state.userNotConfirmed) {
              Navigator.of(context).pushNamed(
                RegisterConfirmScreen.routeName,
                arguments:
                    RegisterConfirmScreenArgs(email: _emailController.text),
              );
            }
          }
        },
        child: _buildPage(),
      ),
    );
  }

  Widget _buildPage() {
    return Container(
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
              AuthTextFormField(
                title: 'Email',
                controller: _emailController,
                errorText: _emailErrorMessage,
              ),
              AuthTextFormField(
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
              child: PLFilledButton(
                onPressed: _signIn,
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed(RegisterScreen.routeName),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
