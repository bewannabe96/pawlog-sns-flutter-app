import 'package:flutter/material.dart';

class AuthTextFieldHelper extends StatelessWidget {
  const AuthTextFieldHelper(
    this.text, {
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}
