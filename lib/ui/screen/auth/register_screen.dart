import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/auth.dart';
import 'package:pawlog/ui/component/pl_page_indicator.dart';
import 'package:pawlog/ui/component/pl_primary_action_button.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
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
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
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
                _currentPage == 2
                    ? PLPrimaryActionButton(
                        title: 'Create an Account',
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    : AuthNavButton(
                        showPrev: _currentPage != 0,
                        onPrev: () => _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        ),
                        onNext: () => _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailPage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AuthTextFormField(title: 'Email'),
        ],
      ),
    );
  }

  Widget _buildNamePage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AuthTextFormField(title: 'Name'),
        ],
      ),
    );
  }

  Widget _buildPasswordPage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AuthTextFormField(title: 'Password', isPassword: true),
          AuthTextFormField(title: 'Password Confirm', isPassword: true),
        ],
      ),
    );
  }
}
