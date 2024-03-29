import 'package:flutter/material.dart';

import 'package:pawlog/src/view/widget/user_search_box.dart';
import 'package:pawlog/src/view/widget/user_search_result.dart';

class UserSearchModal extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => const Color(0xFF0D0C0C).withOpacity(0.8);

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
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(
        animation.drive(
          CurveTween(curve: Curves.fastLinearToSlowEaseIn),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Search',
            style: Theme.of(context).textTheme.title,
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            UserSearchBox(),
            Expanded(
              child: Center(
                child: UserSearchResultArea(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
