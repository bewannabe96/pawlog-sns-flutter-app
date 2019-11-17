import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/bloc/bloc.dart';

import 'package:pawlog/ui/widget/home_bottom_nav_bar.dart';
import 'package:pawlog/ui/modal/user_search_modal.dart';
import 'package:pawlog/ui/page/meetup_start_page.dart';
import 'package:pawlog/ui/page/feed_page.dart';
import 'package:pawlog/ui/page/friend_page.dart';
import 'package:pawlog/ui/page/message_page.dart';
import 'package:pawlog/ui/page/profile_page.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final _tabPages = [
    {
      'pageWidget': const MeetupStartPage(),
      'actionWidgetBuilder': (_) => null,
    },
    {
      'pageWidget': const FeedPage(),
      'actionWidgetBuilder': (_) => null,
    },
    {
      'pageWidget': const FriendPage(),
      'actionWidgetBuilder': (BuildContext context) => <Widget>[
            IconButton(
              onPressed: () => Navigator.of(context).push(UserSearchModal()),
              icon: Icon(FontAwesomeIcons.search),
            ),
          ],
    },
    {
      'pageWidget': const MessagePage(),
      'actionWidgetBuilder': (_) => null,
    },
    {
      'pageWidget': BlocProvider(
        builder: (context) => ProfileBloc(),
        child: ProfilePage(
          profileType: ProfileTypes.Self,
          userID: 1,
        ),
      ),
      'actionWidgetBuilder': (BuildContext context) => <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cog),
            ),
          ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _tabPages[_pageIndex]['pageWidget'] as Widget,
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

  Widget _buildAppBar() {
    final actionWidgetBuilder =
        _tabPages[_pageIndex]['actionWidgetBuilder'] as Function;
    return AppBar(
      title: Text(
        _mapPageTitle(_pageIndex),
        style: Theme.of(context).textTheme.title,
      ),
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      actions: actionWidgetBuilder(context) as List<Widget>,
    );
  }

  String _mapPageTitle(int page) {
    String title = '';
    switch (page) {
      case 0:
        title = 'Meetup';
        break;
      case 1:
        title = 'Feed';
        break;
      case 2:
        title = 'Friend';
        break;
      case 3:
        title = 'Message';
        break;
      case 4:
        final authState = BlocProvider.of<AuthBloc>(context).state;
        if (authState is AuthorizedState) {
          title = authState.user.name;
        }
        break;
    }
    return title;
  }
}
