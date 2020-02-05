import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/style.dart';

class ProfileTitle extends StatelessWidget {
  final Profile profile;

  const ProfileTitle({
    Key key,
    @required this.profile,
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
                    _SummaryItem('Story', profile.stories),
                    _SummaryItem('Follower', profile.followers),
                    _SummaryItem('Following', profile.followings),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 42.0,
                  backgroundImage: profile.imageURL == null
                      ? const AssetImage('res/asset/user_avatar.png')
                      : NetworkImage(profile.imageURL),
                ),
              ),
            ],
          ),
          profile.intro == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    profile.intro,
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
