import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

class FollowActionModal extends ModalRoute {
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
            padding: const EdgeInsets.all(10.0),
            child: _buildMenu(context),
          ),
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildMenuButton('Unfollow', () => Navigator.of(context).pop(1)),
      ],
    );
  }

  Widget _buildMenuButton(String text, Function() onPressed) {
    return FlatButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
