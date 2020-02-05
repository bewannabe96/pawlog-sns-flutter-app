import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final String errorText;
  final String helperText;

  const AuthTextField({
    Key key,
    @required this.label,
    this.controller,
    this.isPassword = false,
    this.errorText,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final underlineBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: darkSecondaryColor, width: 1.5),
    );

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: darkSecondaryColor),
              enabledBorder: underlineBorder,
              focusedBorder: underlineBorder,
              errorText: errorText,
              errorStyle: const TextStyle(color: errorColor),
            ),
            cursorColor: darkSecondaryColor,
          ),
        ),
        helperText != null
            ? Text(
                helperText,
                style: const TextStyle(fontSize: 12, color: darkSecondaryColor),
              )
            : Container(),
      ],
    );
  }
}
