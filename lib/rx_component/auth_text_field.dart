import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final String errorText;

  const AuthTextField({
    Key key,
    @required this.title,
    this.controller,
    this.isPassword = false,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondaryVariant,
        width: 1.5,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
          enabledBorder: underlineBorder,
          focusedBorder: underlineBorder,
          errorText: errorText,
        ),
        cursorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
