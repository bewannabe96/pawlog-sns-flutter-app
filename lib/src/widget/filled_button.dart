import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class PLFilledButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PLFilledButton({
    Key key,
    @required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: FlatButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        color: primaryColor,
        disabledColor: disabledColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        splashColor: Colors.white10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
