import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawlog/provider/profile.dart';

import 'package:pawlog/ui/modal/user_search_modal.dart';
import 'package:pawlog/ui/widget/home_bottom_nav_bar.dart';
import 'package:pawlog/ui/page/meetup_start_page.dart';
import 'package:pawlog/ui/page/feed_page.dart';
import 'package:pawlog/ui/page/friend_page.dart';
import 'package:pawlog/ui/page/message_page.dart';
import 'package:pawlog/ui/page/profile_page.dart';
import 'package:provider/provider.dart';

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
      'title': 'Meetup',
      'pageWidget': const MeetupStartPage(),
      'actionWidgetBuilder': (_) => null,
    },
    {
      'title': 'Feed',
      'pageWidget': const FeedPage(),
      'actionWidgetBuilder': (_) => null,
    },
    {
      'title': 'Friend',
      'pageWidget': const FriendPage(),
      'actionWidgetBuilder': (BuildContext context) => <Widget>[
            IconButton(
              onPressed: () => Navigator.of(context).push(UserSearchModal()),
              icon: Icon(FontAwesomeIcons.search),
            ),
          ],
    },
    {
      'title': 'Message',
      'pageWidget': const MessagePage(),
      'actionWidgetBuilder': (_) => null,
    },
    {
      'title': 'Kate Kim',
      'pageWidget': ChangeNotifierProvider(
        builder: (_) => ProfileProvider(),
        child: const ProfilePage(profileType: ProfileTypes.Self),
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
        _tabPages[_pageIndex]['title'] as String,
        style: Theme.of(context).textTheme.title,
      ),
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      actions: actionWidgetBuilder(context) as List<Widget>,
    );
  }
}
