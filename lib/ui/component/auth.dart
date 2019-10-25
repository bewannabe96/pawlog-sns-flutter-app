import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:pawlog/ui/component/pl_back_button.dart';

class AuthTitleText extends StatefulWidget {
  const AuthTitleText(
    this.title,
    this.description, {
    Key key,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  _AuthTitleTextState createState() => _AuthTitleTextState();
}

class _AuthTitleTextState extends State<AuthTitleText> {
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(
          () {
            _keyboardVisible = visible;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: PLBackButton(color: Theme.of(context).colorScheme.primary),
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Visibility(
          visible: !_keyboardVisible,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              widget.description,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondaryVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key key,
    @required this.title,
    this.isPassword = false,
  }) : super(key: key);

  final String title;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondaryVariant,
        width: 1.5,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: isPassword,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
          enabledBorder: underlineBorder,
          focusedBorder: underlineBorder,
        ),
        cursorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    Key key,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.secondaryVariant,
        ),
      ),
    );
  }
}

class AuthNavButton extends StatelessWidget {
  const AuthNavButton({
    Key key,
    this.showPrev = true,
    this.showNext = true,
    this.onPrev,
    this.onNext,
  }) : super(key: key);

  final bool showPrev;
  final bool showNext;
  final Function onPrev;
  final Function onNext;

  @override
  Widget build(BuildContext context) {
    final button = (String title, Function onPressed) => FlatButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: showPrev,
          child: button('Prev', onPrev),
        ),
        Visibility(
          visible: showNext,
          child: button('Next', onNext),
        ),
      ],
    );
  }
}
