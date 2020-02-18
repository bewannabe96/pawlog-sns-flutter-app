import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/presentation/page/profile_page.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/thunk_action/story_thunk_action.dart';

class ProfilePageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfilePageProps>(
      converter: (store) => _mapStateToProps(store),
      builder: (context, props) => ProfilePage(props: props),
    );
  }
}

ProfilePageProps _mapStateToProps(Store<AppState> store) {
  return ProfilePageProps(
    profile: store.state.userState.profileState.profile,
    profileProcessing: store.state.userState.profileState.processing,
    family: store.state.userState.familyState.family,
    familyProcessing: store.state.userState.familyState.processing,
    stories: store.state.storyState.userStoriesState.stories,
    toggleStoryLike: (Story story) => store.dispatch(toggleStoryLike(story)),
  );
}
