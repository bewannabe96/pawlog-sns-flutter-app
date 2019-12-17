import 'package:flutter/material.dart';

import 'package:pawlog/ui/widget/new_family_option.dart';
import 'package:pawlog/ui/screen/family/create_family_screen.dart';

class NewFamilyModal extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

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
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: NewFamilyOption(
          onCreateFamily: () {
            Navigator.of(context)
                .pushReplacementNamed(CreateFamilyScreen.routeName);
          },
          onJoinFamily: () {},
        ),
      ),
    );
  }
}
