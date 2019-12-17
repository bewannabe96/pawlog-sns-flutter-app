import 'package:flutter/material.dart';

class NewFamilyOption extends StatelessWidget {
  final Function onCreateFamily;
  final Function onJoinFamily;

  const NewFamilyOption({
    @required this.onCreateFamily,
    @required this.onJoinFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            onPressed: onCreateFamily,
            child: Text(
              "Create Family",
              style: TextStyle(fontSize: 20.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 25),
            textColor: Theme.of(context).colorScheme.primary,
          ),
          FlatButton(
            onPressed: onJoinFamily,
            child: Text(
              "Join Familiy",
              style: TextStyle(fontSize: 20.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 25),
            textColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
