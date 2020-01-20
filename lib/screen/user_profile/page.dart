import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import './follow_status.dart';
import './profile_story_timeline.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/widget/profile_title.dart';
import 'package:pawlog/widget/profile_family_list.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoadSuccess) {
          return _buildPage(
            context,
            state.profile,
            state.family,
            state.stories,
          );
        } else if (state is UserProfileLoadProgress) {
          return Material(child: Center(child: PLLoading()));
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildPage(
    BuildContext context,
    Profile profile,
    Family family,
    List<Story> stories,
  ) {
    final authState = BlocProvider.of<AuthenticationBloc>(context).state;

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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ProfileTitle(profile),
              authState is Authenticated &&
                      authState.user.userID == profile.userID
                  ? Container()
                  : FollowStatus(),
              Divider(),
              ProfileFamilyList(family: family),
              Divider(),
              ProfileStoryTimeline(
                stories: stories,
                hasReachedMax: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
