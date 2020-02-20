import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/widget/profile_family_list.dart';
import 'package:pawlog/src/presentation/widget/profile_story_timeline.dart';
import 'package:pawlog/src/presentation/widget/profile_title.dart';

class ProfilePageProps {
  final User user;
  final Family family;
  final bool familyProcessing;
  final List<Story> stories;

  final Function(Story) toggleStoryLike;

  const ProfilePageProps({
    @required this.user,
    @required this.family,
    @required this.familyProcessing,
    @required this.stories,
    @required this.toggleStoryLike,
  });
}

class ProfilePage extends StatefulWidget {
  final ProfilePageProps props;

  const ProfilePage({
    Key key,
    @required this.props,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ProfileTitle(
            user: widget.props.user,
            stories: widget.props.stories.length,
            followers: 0,
            followings: 0,
          ),
          Divider(),
          _buildFamilyList(),
          Divider(),
          ProfileStoryTimeline(
            stories: widget.props.stories,
            hasReachedMax: false,
            onLikeButtonPressed: widget.props.toggleStoryLike,
          )
        ],
      ),
    );
  }

  Widget _buildFamilyList() {
    if (widget.props.family == null) {
      return FlatButton(
        onPressed: () {},
        child: const Text(
          "New Family",
          style: const TextStyle(fontSize: 18.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        textColor: primaryColor,
      );
    } else {
      return ProfileFamilyList(family: widget.props.family);
    }
  }
}
