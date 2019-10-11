import 'package:flutter/material.dart';

import 'package:pawlog/component/pl_bottom_nav_bar.dart';

import 'package:pawlog/page/discover_page.dart';
import 'package:pawlog/page/friends_page.dart';
import 'package:pawlog/page/message_page.dart';
import 'package:pawlog/page/profile_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final List<Map<String, Object>> _pages = const <Map<String, Object>>[
    {'title': 'Discover', 'content': const DiscoverPage()},
    {'title': 'Friends', 'content': const FriendsPage()},
    {'title': 'Message', 'content': const MessagePage()},
    {
      'title': 'Profile',
      'content': const ProfilePage(profileType: ProfileTypes.Self)
    },
  ];

  void _setPageIndex(index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_pageIndex]['title'] as String,
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: _pages[_pageIndex]['content'],
      bottomNavigationBar: PLBottomNavBar(
          currentIndex: _pageIndex, onTap: (index) => _setPageIndex(index)),
    );
  }
}
