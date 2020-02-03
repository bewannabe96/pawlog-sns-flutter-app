import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class PLTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const PLTextField({
    Key key,
    @required this.label,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final underlineBorder = const UnderlineInputBorder(
      borderSide: BorderSide(color: darkSecondaryColor, width: 1.5),
    );

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: accentColor),
        enabledBorder: underlineBorder,
        focusedBorder: underlineBorder,
      ),
      cursorColor: accentColor,
    );
  }
}
