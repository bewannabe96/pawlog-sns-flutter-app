import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pawlog/src/model/model.dart';
import 'package:pawlog/src/entity/entity.dart';

import 'package:pawlog/src/container/widget/profile_story_timeline.dart';
import 'package:pawlog/src/container/widget/profile_title.dart';
import 'package:pawlog/src/container/widget/follow_status.dart';
import 'package:pawlog/src/container/widget/profile_family_list.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = '/user-profile';

  const UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _profile.name,
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ProfileTitle(profile: _profile),
              _profile.isFollowing != null
                  ? FollowStatus(
                      isFollowing: _profile.isFollowing,
                    )
                  : Container(),
              Divider(),
              ProfileFamilyList(family: _family),
              Divider(),
              ProfileStoryTimeline(stories: [], hasReachedMax: false)
            ],
          ),
        ),
      ),
    );
  }
}
