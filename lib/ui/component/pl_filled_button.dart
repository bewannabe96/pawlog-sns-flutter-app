import 'package:flutter/material.dart';

class PLFilledButton extends StatelessWidget {
  const PLFilledButton({
    @required this.title,
    this.onPressed,
    this.color,
  });

  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var _color = color == null ? Theme.of(context).colorScheme.primary : color;

    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      color: _color,
      padding: const EdgeInsets.symmetric(vertical: 12),
      splashColor: Colors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
