import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/widget/profile_story_timeline.dart';
import 'package:pawlog/src/presentation/widget/profile_title.dart';
import 'package:pawlog/src/presentation/widget/profile_family_list.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/user-profile';

  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: needs replacement
  User _user;
  Family _family;

  @override
  void initState() {
    super.initState();
    _loadInitialProfile();
  }

  void _loadInitialProfile() async {
    // TODO: needs implementation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _user.name,
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
              ProfileTitle(user: null, stories: 0, followers: 0, followings: 0),
              // TODO: needs implementation
              // _user.isFollowing != null
              //     ? FollowStatus(
              //         isFollowing: _user.isFollowing,
              //       )
              //     : Container(),
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
