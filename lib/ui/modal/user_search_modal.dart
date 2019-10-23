import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSearchModal extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

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
    return Column(
      children: <Widget>[
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(
            animation.drive(
              CurveTween(curve: Curves.fastLinearToSlowEaseIn),
            ),
          ),
          child: _buildModalContent(context),
        ),
      ],
    );
  }

  Widget _buildModalContent(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppBar(
                title: Text(
                  'Search',
                  style: Theme.of(context).textTheme.title,
                ),
                backgroundColor: Colors.white,
                centerTitle: false,
                elevation: 0,
              ),
              _buildInputArea(context),
              _buildSearchButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 1.5,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'User Email Address',
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
          enabledBorder: underlineBorder,
          focusedBorder: underlineBorder,
        ),
        cursorColor: Theme.of(context).colorScheme.primaryVariant,
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'Search',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      padding: const EdgeInsets.all(15),
      shape: BeveledRectangleBorder(),
      color: Theme.of(context).colorScheme.primary,
      splashColor: Colors.white12,
    );
  }
}
