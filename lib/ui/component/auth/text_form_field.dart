import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key key,
    @required this.title,
    this.controller,
    this.isPassword = false,
    this.helperText,
    this.errorText,
  }) : super(key: key);

  final String title;

  final TextEditingController controller;
  final bool isPassword;

  final String helperText;
  final String errorText;

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
      child: TextFormField(
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
          helperText: helperText,
        ),
        cursorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
