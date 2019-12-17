import 'package:flutter/material.dart';

class FollowStatus extends StatelessWidget {
  const FollowStatus();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      height: 30,
      child: 1 == 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: _buildButton(
                    context,
                    'Message',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 90,
                    child: _buildButton(
                      context,
                      'Friend',
                      color: Theme.of(context).colorScheme.primary,
                      outlined: false,
                    ),
                  ),
                ),
              ],
            )
          : _buildButton(
              context,
              'Follow',
              color: Theme.of(context).colorScheme.primary,
            ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text, {
    Color color,
    bool outlined = true,
  }) {
    final _color =
        color == null ? Theme.of(context).colorScheme.primary : color;
    return FlatButton(
      onPressed: () => {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: outlined ? _color : Colors.white,
        ),
      ),
      color: outlined ? Colors.transparent : _color,
      splashColor: outlined ? _color.withOpacity(0.15) : Colors.white24,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: outlined ? 1 : 0, color: _color),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
