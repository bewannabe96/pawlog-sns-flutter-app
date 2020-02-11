import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/widget/profile_family_list.dart';
import 'package:pawlog/src/presentation/widget/profile_story_timeline.dart';
import 'package:pawlog/src/presentation/widget/profile_title.dart';
import 'package:pawlog/src/presentation/widget/loading_indicator.dart';

class ProfilePageProps {
  final Profile profile;
  final bool profileLoading;
  final Family family;
  final bool familyLoading;

  const ProfilePageProps({
    @required this.profile,
    @required this.profileLoading,
    @required this.family,
    @required this.familyLoading,
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
    return widget.props.profileLoading
        ? Center(child: LoadingIndicator())
        : _buildPage([]);
  }

  Widget _buildPage(List<Story> stories) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ProfileTitle(profile: widget.props.profile),
          Divider(),
          _buildFamilyList(),
          Divider(),
          ProfileStoryTimeline(stories: stories, hasReachedMax: false)
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
