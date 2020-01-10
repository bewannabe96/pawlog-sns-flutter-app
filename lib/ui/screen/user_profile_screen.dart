import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/widget/follow_status.dart';
import 'package:pawlog/ui/widget/profile/profile.dart';
import 'package:pawlog/ui/widget/story_timeline.dart';

class UserProfileScreenArgs {
  final int userID;

  const UserProfileScreenArgs(this.userID);
}

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user-profile';

  final int userID;

  const UserProfileScreen(this.userID, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserProfileBloc>(
      create: (context) => UserProfileBloc()
        ..add(
          LoadUserProfileEvent(userID),
        ),
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoadedState) {
            return _buildPage(
              context,
              state.profile,
              state.family,
              state.stories,
            );
          } else if (state is UserProfileErrorState) {
            return PLError();
          } else {
            return PLLoading();
          }
        },
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    Profile profile,
    Family family,
    List<Story> stories,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          profile.name,
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ProfileTitle(profile),
            FollowStatus(FollowStatuses.Following),
            Divider(),
            ProfileFamilyList(family),
            Divider(),
            StoryTimeline(stories),
          ],
        ),
      ),
    );
  }
}
