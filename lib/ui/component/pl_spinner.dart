import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PLSpinner extends StatelessWidget {
  const PLSpinner({
    this.size = 40,
    this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.spinner,
      size: size,
      color: color,
    );
  }
}
