import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class PLOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PLOutlinedButton({
    @required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      splashColor: primaryColor.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2, color: primaryColor),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
