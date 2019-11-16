import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/ui/component/auth.dart';
import 'package:pawlog/ui/screen/auth/confirmation_screen.dart';
import 'package:pawlog/ui/component/pl_page_indicator.dart';
import 'package:pawlog/ui/component/pl_filled_button.dart';
import 'package:pawlog/ui/component/pl_outlined_button.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  PageController _pageController;
  int _currentPage = 0;

  TextEditingController _emailController;
  TextEditingController _nameController;
  TextEditingController _passwordController;
  TextEditingController _passwordConfirmController;

  String _emailErrorMessage;
  String _nameErrorMessage;
  String _passwordErrorMessage;
  String _passwordConfirmErrorMessage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page.toInt();
      });
    });
    _emailController.addListener(() {
      setState(() {
        _emailErrorMessage = null;
      });
    });
    _nameController.addListener(() {
      setState(() {
        _nameErrorMessage = null;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _passwordErrorMessage = null;
      });
    });
    _passwordConfirmController.addListener(() {
      setState(() {
        _passwordConfirmErrorMessage = null;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _createAccount() {
    BlocProvider.of<RegisterBloc>(context).add(
      NewRegisterEvent(
        _emailController.text,
        _nameController.text,
        _passwordController.text,
        _passwordConfirmController.text,
      ),
    );
    Navigator.of(context).pushReplacementNamed(
      ConfirmationScreen.routeName,
      arguments: ConfirmationScreenArgs(_emailController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<RegisterBloc>(context).state;
    if (state is RegisterErrorState) {
      switch (state.type) {
        case RegisterErrorTypes.EmailError:
          _animateToPage(0);
          setState(() {
            _emailErrorMessage = state.message;
          });
          break;
        case RegisterErrorTypes.NameError:
          _animateToPage(1);
          setState(() {
            _nameErrorMessage = state.message;
          });
          break;
        case RegisterErrorTypes.PasswordError:
          _animateToPage(2);
          setState(() {
            _passwordErrorMessage = state.message;
          });
          break;
        case RegisterErrorTypes.PasswordConfirmError:
          _animateToPage(2);
          setState(() {
            _passwordConfirmErrorMessage = state.message;
          });
          break;
        case RegisterErrorTypes.Unknown:
      }
    }

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AuthTitleText(
                  'Welcome!',
                  'Sign up and meet new dogs around you.',
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            children: <Widget>[
                              _buildEmailPage(),
                              _buildNamePage(),
                              _buildPasswordPage(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: PLPageIndicator(
                            controller: _pageController,
                            count: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _animateToPrev() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _animateToNext() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Widget _buildButtons() {
    switch (_currentPage) {
      case 0:
        return AuthNavButton(
          showPrev: false,
          onNext: _animateToNext,
        );
      case 2:
        return Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PLOutlinedButton(
                title: 'Prev',
                onPressed: _animateToPrev,
              ),
            ),
            Expanded(
              child: PLFilledButton(
                title: 'Create an Accout',
                onPressed: _createAccount,
              ),
            ),
          ],
        );
      default:
        return AuthNavButton(
          onPrev: _animateToPrev,
          onNext: _animateToNext,
        );
    }
  }

  Widget _buildEmailPage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AuthTextFormField(
            title: 'Email',
            controller: _emailController,
            errorText: _emailErrorMessage,
          ),
          AuthTextFieldHelper(
            'Please enter a using email. Later we will send you a verification code.',
          ),
        ],
      ),
    );
  }

  Widget _buildNamePage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AuthTextFormField(
            title: 'Name',
            controller: _nameController,
            errorText: _nameErrorMessage,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordPage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AuthTextFormField(
            title: 'Password',
            controller: _passwordController,
            isPassword: true,
            errorText: _passwordErrorMessage,
          ),
          AuthTextFieldHelper(
            'Must be at least 8 characters containing lowercase, uppercase and number.',
          ),
          AuthTextFormField(
            title: 'Password Confirm',
            isPassword: true,
            controller: _passwordConfirmController,
            errorText: _passwordConfirmErrorMessage,
          ),
        ],
      ),
    );
  }
}
