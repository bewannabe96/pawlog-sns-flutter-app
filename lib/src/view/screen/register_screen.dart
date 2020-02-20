import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'package:pawlog/src/view/widget/auth_text_field.dart';
import 'package:pawlog/src/view/widget/auth_title.dart';
import 'package:pawlog/src/view/widget/bottom_nav_button.dart';
import 'package:pawlog/src/view/widget/filled_button.dart';
import 'package:pawlog/src/view/widget/outlined_button.dart';
import 'package:pawlog/src/view/widget/page_indicator.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  int _currentPage = 0;

  bool _emailReady = false;
  bool _nameReady = false;
  bool _passwordReady = false;
  bool _confirmReady = false;

  String _emailErrorMessage;
  String _nameErrorMessage;
  String _passwordErrorMessage;
  String _confirmErrorMessage;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(
      () => setState(() {
        _currentPage = _pageController.page.toInt();
      }),
    );
    _emailController.addListener(
      () => setState(() {
        _emailErrorMessage = null;
        _emailReady = _emailController.text.length > 0;
      }),
    );
    _nameController.addListener(
      () => setState(() {
        _nameErrorMessage = null;
        _nameReady = _nameController.text.length > 0;
      }),
    );
    _passwordController.addListener(
      () => setState(() {
        _passwordErrorMessage = null;
        _passwordReady = _passwordController.text.length > 0;
      }),
    );
    _confirmController.addListener(
      () => setState(() {
        _confirmErrorMessage = null;
        _confirmReady = _confirmController.text.length > 0;
      }),
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

  void _createAccount() {
    final _email = _emailController.text;
    if (!EmailValidator.validate(_email)) {
      setState(() {
        _emailErrorMessage = 'Invalid email address format.';
      });
      _animateToPage(0);
      return;
    }

    final _password = _passwordController.text;
    String _passwordError;
    if (_password.length < 8)
      _passwordError = 'Password is too short.';
    else if (!RegExp(r"[a-z]").hasMatch(_password))
      _passwordError = 'Password must contain lowercase characters.';
    else if (!RegExp(r"[A-Z]").hasMatch(_password))
      _passwordError = 'Password must contain uppercase characters.';
    else if (!RegExp(r"[0-9]").hasMatch(_password))
      _passwordError = 'Password must contain numeric character.';

    if (_passwordError != null) {
      setState(() {
        _passwordErrorMessage = _passwordError;
      });
      _animateToPage(2);
      return;
    }

    final _passwordConfirm = _confirmController.text;
    if (_password != _passwordConfirm) {
      setState(() {
        _confirmErrorMessage = 'Password does not match.';
      });
      _animateToPage(2);
      return;
    }

    // TODO: needs implementation
    print('register');
  }

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

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
                AuthTitle(
                  title: 'Welcome!',
                  description: 'Sign up and meet new dogs around you.',
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
                Container(
                  height: 50,
                  child: Center(
                    child: _buildButtons(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    switch (_currentPage) {
      case 0:
        return BottomNavButton(
          onNext: _animateToNext,
        );
      case 2:
        return Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PLOutlinedButton(
                label: 'Prev',
                onPressed: _animateToPrev,
              ),
            ),
            Expanded(
              child: PLFilledButton(
                label: 'Create an Account',
                onPressed:
                    _emailReady && _nameReady && _passwordReady && _confirmReady
                        ? _createAccount
                        : null,
              ),
            ),
          ],
        );
      default:
        return BottomNavButton(
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
          AuthTextField(
            label: 'Email',
            controller: _emailController,
            errorText: _emailErrorMessage,
            helperText:
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
          AuthTextField(
            label: 'Name',
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
          AuthTextField(
            label: 'Password',
            controller: _passwordController,
            isPassword: true,
            errorText: _passwordErrorMessage,
            helperText:
                'Must be at least 8 characters containing lowercase, uppercase and number.',
          ),
          AuthTextField(
            label: 'Password Confirm',
            isPassword: true,
            controller: _confirmController,
            errorText: _confirmErrorMessage,
          ),
        ],
      ),
    );
  }
}
