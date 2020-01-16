import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './bloc/bloc.dart';
import './feed_page.dart';
import './friend_page.dart';
import './chat_page.dart';
import './profile_page.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/ui/screen/settings/settings_screen.dart';
import 'package:pawlog/ui/screen/story/new_story_screen.dart';

import 'package:pawlog/ui/widget/home_bottom_nav_bar.dart';
import 'package:pawlog/ui/modal/user_search_modal.dart';

class _PageConfig {
  final String title;
  final Widget body;
  final List<Widget> actionWidgets;

  const _PageConfig({
    this.title,
    this.body,
    this.actionWidgets,
  });
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final config = _mapPageConfig(_pageIndex);

    return MultiBlocProvider(
      providers: [
        BlocProvider<FeedBloc>(
          create: (BuildContext context) => FeedBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          )..add(FeedPageLoaded()),
        ),
        BlocProvider<FriendBloc>(
          create: (BuildContext context) => FriendBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          )..add(FriendPageLoaded()),
        ),
        BlocProvider<ChatBloc>(
          create: (BuildContext context) => ChatBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          )..add(ChatPageLoaded()),
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => ProfileBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          )..add(ProfilePageLoaded()),
        ),
      ],
      child: Scaffold(
        appBar: _buildAppBar(config),
        body: config.body,
        bottomNavigationBar: HomeBottomNavBar(
          currentIndex: _pageIndex,
          onTap: (index) => setState(
            () {
              _pageIndex = index;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(_PageConfig config) {
    return AppBar(
      title: Text(
        config.title,
        style: Theme.of(context).textTheme.title,
      ),
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      actions: config.actionWidgets,
    );
  }

  _PageConfig _mapPageConfig(int page) {
    final authState = BlocProvider.of<AuthenticationBloc>(context).state;
    switch (page) {
      case 0:
        return _PageConfig(
          title: 'Feed',
          body: const FeedPage(),
        );
      case 2:
        return _PageConfig(
          title: 'Friend',
          body: const FriendPage(),
          actionWidgets: <Widget>[
            IconButton(
              onPressed: () => Navigator.of(context).push(UserSearchModal()),
              icon: const Icon(FontAwesomeIcons.search),
            ),
          ],
        );
      case 3:
        return _PageConfig(
          title: 'Chat',
          body: const ChatPage(),
        );
      case 4:
        if (authState is Authenticated) {
          return _PageConfig(
            title: authState.user.name,
            body: ProfilePage(),
            actionWidgets: <Widget>[
              IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(NewStoryScreen.routeName),
                icon: const Icon(FontAwesomeIcons.solidEdit),
              ),
              IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(SettingsScreen.routeName),
                icon: const Icon(FontAwesomeIcons.cog),
              ),
            ],
          );
        }
        break;
    }
    return null;
  }
}
