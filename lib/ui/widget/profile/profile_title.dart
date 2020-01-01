import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

class ProfileTitle extends StatelessWidget {
  final Profile profile;

  const ProfileTitle(this.profile, {Key key}) : super(key: key);

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
                child: const CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.grey,
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
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
        ],
      ),
    );
  }
}
