import 'package:flutter/material.dart';
import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

import 'package:pawlog/manager/manager.dart';

import 'package:pawlog/rx_screen/home_screen/feed_page.dart';
import 'package:pawlog/rx_screen/home_screen/friend_page.dart';

mixin HomeScreenPage on Widget {
  IconData icon();
  String title(BuildContext context);
  List<Widget> actionWidgets(BuildContext context) => const <Widget>[];
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final Map<int, HomeScreenPage> _pages = {
    0: FeedPage(),
    1: FriendPage(),
    // 2: ChatPage(),
    // 3: ProfilePage(),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_pageIndex].title(context),
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        actions: _pages[_pageIndex].actionWidgets(context),
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: MediaQuery.of(context).padding.bottom + 56,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 0.5,
          ),
        ],
      ),
      child: Row(
        children: _pages.keys
            .map(
              (pageIndex) => Expanded(
                child: IconButton(
                  onPressed: () => setState(() {
                    _pageIndex = pageIndex;
                  }),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    _pages[pageIndex].icon(),
                    color: pageIndex == _pageIndex
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[400],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
