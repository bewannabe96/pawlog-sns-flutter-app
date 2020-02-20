import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/state/app_state.dart';

import 'package:pawlog/src/container/login_screen_container.dart';
import 'package:pawlog/src/container/feed_page_container.dart';
import 'package:pawlog/src/container/friend_page_container.dart';
import 'package:pawlog/src/container/profile_page_container.dart';

import 'package:pawlog/src/view/screen/home_screen.dart';
import 'package:pawlog/src/view/screen/settings_screen.dart';
import 'package:pawlog/src/view/screen/new_story_screen.dart';

import 'package:pawlog/src/view/modal/user_search_modal.dart';

import 'package:pawlog/src/view/page/chat_page.dart';

class AuthSwitch extends StatelessWidget {
  static const routeName = '/';

  const AuthSwitch({Key key}) : super(key: key);

  void _navigateToNewStory(BuildContext context) {
    Navigator.of(context).pushNamed(NewStoryScreen.routeName);
  }

  void _openUserSearch(BuildContext context) {
    Navigator.of(context).push(UserSearchModal());
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.of(context).pushNamed(SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, viewmodel) => viewmodel.isAuthorized
          ? HomeScreen(
              pages: {
                0: HomeScreenPageConfig(
                  page: FeedPageContainer(),
                  icon: FontAwesomeIcons.solidNewspaper,
                  title: 'Feed',
                  actions: <Widget>[
                    IconButton(
                      onPressed: () => _navigateToNewStory(context),
                      icon: const Icon(FontAwesomeIcons.solidEdit),
                    ),
                  ],
                ),
                1: HomeScreenPageConfig(
                  page: FriendPageContainer(),
                  icon: FontAwesomeIcons.users,
                  title: 'Friend',
                  actions: <Widget>[
                    IconButton(
                      onPressed: () => _openUserSearch(context),
                      icon: const Icon(FontAwesomeIcons.search),
                    ),
                  ],
                ),
                2: HomeScreenPageConfig(
                  page: ChatPage(),
                  icon: FontAwesomeIcons.solidComments,
                  title: 'Chat',
                ),
                3: HomeScreenPageConfig(
                  page: ProfilePageContainer(),
                  icon: FontAwesomeIcons.solidUserCircle,
                  title: viewmodel.user?.name ?? '',
                  actions: <Widget>[
                    IconButton(
                      onPressed: () => _navigateToSettings(context),
                      icon: const Icon(FontAwesomeIcons.cog),
                    ),
                  ],
                ),
              },
            )
          : LoginScreenContainer(),
    );
  }
}

class _ViewModel {
  final bool isAuthorized;
  final User user;

  _ViewModel({
    this.isAuthorized,
    this.user,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      isAuthorized: store.state.authState.isAuthorized,
      user: store.state.authState.user,
    );
  }
}
