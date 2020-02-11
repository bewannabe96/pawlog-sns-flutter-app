import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/reducer/auth_reducer.dart';
import 'package:pawlog/src/reducer/user_reducer.dart';
import 'package:pawlog/src/reducer/friend_reducer.dart';
import 'package:pawlog/src/reducer/story_reducer.dart';

AppState appReducer(AppState state, action) {
  print(action);

  return AppState(
    authState: authReducer(state.authState, action),
    userState: profileReducer(state.userState, action),
    friendState: friendReducer(state.friendState, action),
    storyState: storyReducer(state.storyState, action),
  );
}
