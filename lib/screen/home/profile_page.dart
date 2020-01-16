import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/screen/story_view/screen.dart';

import 'package:pawlog/widget/story_item.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/widget/profile/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoaded) {
          return _buildPage(context, state.profile, state.stories);
        } else if (state is ProfileLoading) {
          return Center(
            child: PLLoading(),
          );
        } else {
          return PLError();
        }
      },
    );
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
          ProfileTitle(profile),
          Divider(),
          _buildFamilyList(),
          Divider(),
          _buildStoryTimeline(context, stories),
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

  Widget _buildStoryTimeline(
    BuildContext context,
    List<Story> stories,
  ) {
    final navigateToStoryView = (Story story) {
      Navigator.of(context).pushNamed(
        StoryViewScreen.routeName,
        arguments: StoryViewScreenArgs(story: story),
      );
    };

    final likeStory = (Story story) {
      // BlocProvider.of<FeedBloc>(context).add(
      //   StoryLikeToggled(story),
      // );
    };

    if (stories.isEmpty) {
      return Center(
        child: Text(
          'No story exists.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
      );
    }

    return Column(
      children: stories
          .map(
            (story) => StoryItem(
              story: story,
              onCommentButtonPressed: navigateToStoryView,
              onLikeButtonPressed: likeStory,
            ),
          )
          .toList(),
    );
  }
}
