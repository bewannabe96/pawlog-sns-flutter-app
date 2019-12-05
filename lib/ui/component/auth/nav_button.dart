import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/pl_outlined_button.dart';

class AuthNavButton extends StatelessWidget {
  final Function onPrev;
  final Function onNext;

  const AuthNavButton({
    Key key,
    this.onPrev,
    this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: onPrev != null,
          child: PLOutlinedButton(title: 'Prev', onPressed: onPrev),
        ),
        Visibility(
          visible: onNext != null,
          child: PLOutlinedButton(title: 'Next', onPressed: onNext),
        ),
      ],
    );
  }
}
