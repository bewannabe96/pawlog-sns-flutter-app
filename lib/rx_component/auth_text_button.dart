import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const AuthTextButton({
    Key key,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.secondaryVariant,
        ),
      ),
    );
  }
}
