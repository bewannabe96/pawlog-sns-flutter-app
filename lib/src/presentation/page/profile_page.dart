import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';
import 'package:pawlog/src/entity/entity.dart';

import 'package:pawlog/src/presentation/widget/profile_family_list.dart';
import 'package:pawlog/src/presentation/widget/profile_story_timeline.dart';
import 'package:pawlog/src/presentation/widget/profile_title.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({Key key, @required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // TODO: needs replacement
  Profile _profile;
  Family _family;

  @override
  void initState() {
    super.initState();
    _loadInitialProfile();
  }

  void _loadInitialProfile() async {
    // TODO: needs implementation
    var jsonstring =
        await rootBundle.loadString('res/sample/user-profile.json');
    final json = jsonDecode(jsonstring);

    final entity = ProfileEntity.fromJson(json);
    final profile = Profile.fromEntity(entity);

    setState(() {
      _profile = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context, _profile, []);
  }

  Widget _buildPage(
    BuildContext context,
    Profile profile,
    List<Story> stories,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ProfileTitle(profile: profile),
          Divider(),
          _buildFamilyList(),
          Divider(),
          ProfileStoryTimeline(stories: stories, hasReachedMax: false)
        ],
      ),
    );
  }

  Widget _buildFamilyList() {
    if (_family == null) {
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
      return ProfileFamilyList(family: _family);
    }
  }
}
