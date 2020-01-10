import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/widget/profile/profile.dart';
import 'package:pawlog/ui/widget/story_timeline.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoadedState) {
          return _buildPage(state.profile, state.stories);
        } else if (state is ProfileLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildPage(Profile profile, List<Story> stories) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ProfileTitle(profile),
          Divider(),
          _buildFamilyList(),
          Divider(),
          StoryTimeline(stories),
        ],
      ),
    );
  }

  Widget _buildFamilyList() {
    return BlocBuilder<FamilyBloc, FamilyState>(
      builder: (BuildContext context, FamilyState state) {
        if (state is FamilyLoadedState) {
          if (state.family == null) {
            return FlatButton(
              onPressed: () {},
              child: Text(
                "New Family",
                style: TextStyle(fontSize: 18.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              textColor: Theme.of(context).colorScheme.primary,
            );
          } else {
            return ProfileFamilyList(state.family);
          }
        } else if (state is FamilyLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }
}
