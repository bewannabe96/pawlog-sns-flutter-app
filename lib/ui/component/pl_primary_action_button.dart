import 'package:flutter/material.dart';

class PLPrimaryActionButton extends StatelessWidget {
  const PLPrimaryActionButton({
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

    return RaisedButton(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
