import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:pawlog/ui/component/pl_back_button.dart';

class AuthTitleText extends StatefulWidget {
  const AuthTitleText(
    this.title,
    this.description, {
    Key key,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  _AuthTitleTextState createState() => _AuthTitleTextState();
}

class _AuthTitleTextState extends State<AuthTitleText> {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: PLBackButton(color: Theme.of(context).colorScheme.primary),
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Visibility(
          visible: !_keyboardVisible,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              widget.description,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondaryVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
