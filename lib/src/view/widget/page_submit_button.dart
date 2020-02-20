import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class PageSubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PageSubmitButton({
    Key key,
    @required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        child: SafeArea(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: const BeveledRectangleBorder(),
        color: primaryColor,
        disabledColor: disabledColor,
      ),
    );
  }
}
