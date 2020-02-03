import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class PLFilledButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  final bool wrapContent;

  const PLFilledButton({
    Key key,
    @required this.label,
    this.onPressed,
    this.wrapContent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wrapContent ? null : double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
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
