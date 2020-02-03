import 'package:flutter/material.dart';

class ActionModal extends ModalRoute {
  final Map<String, Function()> actions;

  ActionModal({@required this.actions});

  @override
  Duration get transitionDuration => Duration(milliseconds: 150);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => const Color(0xFF0D0C0C).withOpacity(0.4);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Center(
      child: FadeTransition(
        opacity: animation,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: actions.keys
                  .map((label) => _buildActionItem(
                        context,
                        label,
                        actions[label],
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionItem(
    BuildContext context,
    String label,
    Function() action,
  ) {
    return FlatButton(
      onPressed: () {
        action();
        Navigator.of(context).pop();
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(label, style: TextStyle(fontSize: 15.0)),
      ),
    );
  }
}
