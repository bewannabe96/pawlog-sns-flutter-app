import 'package:flutter/material.dart';

import 'package:pawlog/page/signup_email_page.dart';
import 'package:pawlog/page/signup_phone_page.dart';

enum SignupSteps {
  Email,
  Phone,
}

class SignupScreen extends StatefulWidget {
  SignupScreen({
    Key key,
    @required this.signupStep,
    this.isFirstStep = false,
    this.isLastStep = false,
    this.onFinishSignup,
  }) : super(key: key);

  final SignupSteps signupStep;
  final bool isFirstStep;
  final bool isLastStep;
  final Function onFinishSignup;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          width: double.infinity,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            children: <Widget>[
              Expanded(
                child: _buildStepPage(),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: _buildStepButtons()),
            ],
          )),
    );
  }

  Widget _buildStepPage() {
    switch (widget.signupStep) {
      case SignupSteps.Email:
        return const SignupEmailPage();
      case SignupSteps.Phone:
        return const SignupPhonePage();
    }
    return null;
  }

  Widget _buildStepButtons() {
    var buttons = <Widget>[];
    MainAxisAlignment alignment = MainAxisAlignment.spaceBetween;

    widget.isFirstStep
        ? alignment = MainAxisAlignment.end
        : buttons.add(FlatButton(
            onPressed: () => widget.onFinishSignup(),
            child: const Text("Previous"),
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
          ));
    widget.isLastStep
        ? alignment = MainAxisAlignment.start
        : buttons.add(FlatButton(
            onPressed: () => {},
            child: const Text("Next"),
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
          ));
    alignment = widget.isFirstStep && widget.isLastStep
        ? MainAxisAlignment.spaceBetween
        : alignment;

    return Row(
      mainAxisAlignment: alignment,
      children: buttons,
    );
  }
}
