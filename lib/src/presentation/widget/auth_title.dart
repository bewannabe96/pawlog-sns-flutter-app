import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:pawlog/src/style.dart';

class AuthTitle extends StatefulWidget {
  final String title;
  final String description;

  final bool displayBackButton;

  const AuthTitle({
    Key key,
    @required this.title,
    this.description,
    this.displayBackButton = true,
  }) : super(key: key);

  @override
  _AuthTitleState createState() => _AuthTitleState();
}

class _AuthTitleState extends State<AuthTitle> {
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
        widget.displayBackButton
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    FontAwesomeIcons.arrowAltCircleLeft,
                    size: 40,
                    color: primaryColor,
                  ),
                ),
              )
            : Container(),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 32, color: primaryColor),
        ),
        widget.description == null
            ? Container()
            : Visibility(
                visible: !_keyboardVisible,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: darkSecondaryColor,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
