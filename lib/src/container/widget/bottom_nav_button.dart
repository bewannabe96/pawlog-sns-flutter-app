import 'package:flutter/material.dart';

import 'package:pawlog/src/container/widget/outlined_button.dart';

class BottomNavButton extends StatelessWidget {
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const BottomNavButton({
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
          child: PLOutlinedButton(label: 'Prev', onPressed: onPrev),
        ),
        Visibility(
          visible: onNext != null,
          child: PLOutlinedButton(label: 'Next', onPressed: onNext),
        ),
      ],
    );
  }
}
