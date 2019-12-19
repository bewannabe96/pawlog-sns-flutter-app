import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/ui/screen/settings/settings_screen.dart';

import 'package:pawlog/ui/widget/home_bottom_nav_bar.dart';
import 'package:pawlog/ui/modal/user_search_modal.dart';
import 'package:pawlog/ui/page/meetup_start_page.dart';
import 'package:pawlog/ui/page/feed_page.dart';
import 'package:pawlog/ui/page/friend_page.dart';
import 'package:pawlog/ui/page/message_page.dart';
import 'package:pawlog/ui/page/profile_page.dart';

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

    return Scaffold(
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
    final authState = BlocProvider.of<AuthBloc>(context).state;
    switch (page) {
      case 0:
        if (authState is AuthorizedState) {
          return _PageConfig(
            title: 'Meetup',
            body: MeetupStartPage(),
          );
        }
        break;
      case 1:
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
          title: 'Message',
          body: const MessagePage(),
        );
      case 4:
        if (authState is AuthorizedState) {
          return _PageConfig(
            title: authState.user.name,
            body: ProfilePage(),
            actionWidgets: <Widget>[
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
