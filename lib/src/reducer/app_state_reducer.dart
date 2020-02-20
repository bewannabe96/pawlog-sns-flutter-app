import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/reducer/auth_reducer.dart';

import 'package:pawlog/src/reducer/friends_reducer.dart';
import 'package:pawlog/src/reducer/family_reducer.dart';

import 'package:pawlog/src/reducer/feed_reducer.dart';
import 'package:pawlog/src/reducer/user_stories_reducer.dart';
import 'package:pawlog/src/reducer/story_detail_reducer.dart';

AppState appReducer(AppState state, action) {
  print(action);

  return AppState(
    authState: authReducer(state.authState, action),
    friendsState: friendsReducer(state.friendsState, action),
    familyState: familyReducer(state.familyState, action),
    feedState: feedReducer(state.feedState, action),
    userStoriesState: userStoriesReducer(state.userStoriesState, action),
    storyDetailState: storyDetailReducer(state.storyDetailState, action),
  );
}
