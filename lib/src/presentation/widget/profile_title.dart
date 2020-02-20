import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/style.dart';

class ProfileTitle extends StatelessWidget {
  final User user;
  final int stories;
  final int followers;
  final int followings;

  const ProfileTitle({
    Key key,
    @required this.user,
    @required this.stories,
    @required this.followers,
    @required this.followings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    _SummaryItem('Story', stories),
                    _SummaryItem('Follower', followers),
                    _SummaryItem('Following', followings),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 42.0,
                  backgroundImage: user.imageURL == null
                      ? const AssetImage('res/asset/user_avatar.png')
                      : NetworkImage(user.imageURL),
                ),
              ),
            ],
          ),
          user.intro == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    user.intro,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final int value;

  const _SummaryItem(
    this.title,
    this.value,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: darkSecondaryColor,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
