import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/ui/component/auth/auth.dart';
import 'package:pawlog/ui/component/pl_filled_button.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

class ConfirmationScreenArgs {
  const ConfirmationScreenArgs(this.email);

  final String email;
}

class ConfirmationScreen extends StatefulWidget {
  static const routeName = '/auth/confirmation-confirm';

  const ConfirmationScreen({
    Key key,
    @required this.email,
  }) : super(key: key);

  final String email;

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  TextEditingController _verificationCodeController;

  String _errorMessage;

  @override
  void initState() {
    super.initState();
    _verificationCodeController = TextEditingController();
    _verificationCodeController.addListener(() {
      setState(() {
        _errorMessage = null;
      });
    });
  }

  @override
  void dispose() {
    _verificationCodeController.dispose();
    super.dispose();
  }

  void _confirmRegistration() {
    BlocProvider.of<RegisterBloc>(context).add(
      ConfirmRegistrationEvent(
        widget.email,
        _verificationCodeController.text,
      ),
    );
  }

  void _resendVerificationCode() {
    BlocProvider.of<RegisterBloc>(context).add(
      ResendConfirmCodeEvent(widget.email),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<RegisterBloc>(context),
      listener: (BuildContext context, RegisterState state) {
        if (state is VerificationSucceedState) {
          Navigator.of(context).pop();
        } else if (state is VerificationErrorState) {
          switch (state.type) {
            case VerificationErrorTypes.EmptyCode:
              setState(() {
                _errorMessage = 'Please type the verification code.';
              });
              break;
            case VerificationErrorTypes.MismatchCode:
              setState(() {
                _errorMessage = 'Verification code is not correct.';
              });
              break;
            case VerificationErrorTypes.Unknown:
          }
        }
      },
      child: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            FontAwesomeIcons.envelope,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Please type the verification code sent to',
                            ),
                            Text(
                              widget.email,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: AuthTextFormField(
                        title: 'Verification Code',
                        controller: _verificationCodeController,
                        errorText: _errorMessage,
                      ),
                    ),
                    AuthTextButton(
                      title: 'Resend Code',
                      onPressed: _resendVerificationCode,
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (BuildContext context, RegisterState state) {
                    if (state is VerificationProcessingState) {
                      return PLLoading();
                    } else {
                      return PLFilledButton(
                        title: 'Verify Email',
                        onPressed: _confirmRegistration,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
