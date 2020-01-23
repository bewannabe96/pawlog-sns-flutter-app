import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;

  const FilledButton({
    @required this.title,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    var _color = color == null ? Theme.of(context).colorScheme.primary : color;

    return FlatButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      color: _color,
      padding: const EdgeInsets.symmetric(vertical: 15),
      splashColor: Colors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
