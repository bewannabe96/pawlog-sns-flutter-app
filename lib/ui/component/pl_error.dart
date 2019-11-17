import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PLError extends StatelessWidget {
  final String message;

  const PLError({
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.exclamationTriangle,
            color: Theme.of(context).colorScheme.secondaryVariant,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Oops!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondaryVariant,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
