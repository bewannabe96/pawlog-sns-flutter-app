import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PLBackButton extends StatelessWidget {
  const PLBackButton({
    this.color = Colors.black,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Icon(
        FontAwesomeIcons.arrowAltCircleLeft,
        size: 40,
        color: color,
      ),
    );
  }
}
