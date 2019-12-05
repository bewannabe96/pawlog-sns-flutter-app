import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/screen/auth/confirmation_screen.dart';
import 'package:pawlog/ui/component/auth/auth.dart';
import 'package:pawlog/ui/component/pl_filled_button.dart';
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

  TextEditingController _emailController;
  TextEditingController _passwordController;

  String _errorMessage;
  String _passwordErrorMessage;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(
          () {
            _keyboardVisible = visible;
          },
        );
      },
    );
    _emailController.addListener(() {
      setState(() {
        _errorMessage = null;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _errorMessage = null;
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
    BlocProvider.of<AuthBloc>(context).add(
      SignInEvent(_emailController.text, _passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<AuthBloc>(context),
      listener: (BuildContext context, AuthState state) {
        if (state is SignInErrorState) {
          switch (state.type) {
            case SignInErrorTypes.EmptyEmail:
              _errorMessage = 'Please type the email.';
              break;
            case SignInErrorTypes.EmptyPassword:
              _passwordErrorMessage = 'Please type the password.';
              break;
            case SignInErrorTypes.UserNotExist:
              _errorMessage = 'User does not exist.';
              break;
            case SignInErrorTypes.NotAuthorized:
              _errorMessage = 'Incorrect username or password.';
              break;
            case SignInErrorTypes.UserNotConfirmed:
              Navigator.of(context).pushNamed(
                ConfirmationScreen.routeName,
                arguments: ConfirmationScreenArgs(_emailController.text),
              );
              break;
            case SignInErrorTypes.Unknwon:
          }
        }
      },
      child: _buildPage(),
    );
  }

  Widget _buildPage() {
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state is SignInProcessingState
            ? PLLoading()
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        AuthTextFormField(
                          title: 'Email',
                          controller: _emailController,
                          errorText: _errorMessage,
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
                            onPressed: () => Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
