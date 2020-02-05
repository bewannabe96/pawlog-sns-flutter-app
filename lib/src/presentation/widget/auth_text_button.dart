import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class AuthTextButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const AuthTextButton({
    Key key,
    @required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: darkSecondaryColor),
      ),
    );
  }
}
