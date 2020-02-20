import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/view/modal/action_modal.dart';

import 'package:pawlog/src/view/screen/chat_screen.dart';

class FollowStatus extends StatelessWidget {
  final int isFollowing;

  const FollowStatus({
    Key key,
    @required this.isFollowing,
  }) : super(key: key);

  void _navigateToChat(BuildContext context) {
    Navigator.of(context).pushNamed(ChatScreen.routeName);
  }

  void _followUser() {
    // TODO: implement followUser
    print('follow user');
  }

  void _unfollowUser() {
    // TODO: implement unfollowUser
    print('unfollow user');
  }

  void _showFollowActionModal(BuildContext context) {
    Navigator.of(context).push(
      ActionModal(
        actions: {
          'Unfollow': _unfollowUser,
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      height: 32.0,
      child: isFollowing == 1 ? _buildFollowing(context) : _buildNotFollowing(),
    );
  }

  Widget _buildFollowing(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: _FollowButton(
            text: 'Message',
            onPressed: () => _navigateToChat(context),
            color: primaryColor,
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: _FollowButton(
            text: 'Following',
            onPressed: () => _showFollowActionModal(context),
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
