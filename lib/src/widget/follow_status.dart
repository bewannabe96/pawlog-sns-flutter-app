import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class FollowStatus extends StatelessWidget {
  final int isFollowing;

  const FollowStatus({
    Key key,
    @required this.isFollowing,
  }) : super(key: key);

  void _navigateToChat() {
    // TODO: needs implementation
    print('navigate to chat');
  }

  void _followUser() {
    // TODO: needs implementation
    print('follow user');
  }

  void _unfollowUser() async {
    print('unfollow user');
    // switch (await Navigator.of(context).push(FollowActionModal())) {
    //   case 1:
    //     // TODO: needs implementation
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      height: 32.0,
      child: isFollowing != -1 ? _buildFollowing() : _buildNotFollowing(),
    );
  }

  Widget _buildFollowing() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: _FollowButton(
            text: 'Message',
            onPressed: _navigateToChat,
            color: primaryColor,
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: _FollowButton(
            text: 'Following',
            onPressed: _unfollowUser,
            color: primaryColor,
            outlined: false,
          ),
        ),
      ],
    );
  }

  Widget _buildNotFollowing() {
    return _FollowButton(
      text: 'Follow',
      onPressed: _followUser,
      color: primaryColor,
    );
  }
}

class _FollowButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  final bool outlined;

  const _FollowButton({
    @required this.text,
    @required this.onPressed,
    this.color,
    this.outlined = true,
  });

  @override
  Widget build(BuildContext context) {
    final _color = color == null ? primaryColor : color;

    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.5,
          color: outlined ? _color : Colors.white,
        ),
      ),
      color: outlined ? Colors.transparent : _color,
      splashColor: outlined ? _color.withOpacity(0.15) : Colors.white24,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: outlined ? 1.0 : 0, color: _color),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
