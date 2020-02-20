import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class HomeScreenPageConfig {
  Widget page;
  IconData icon;
  String title;
  List<Widget> actions;

  HomeScreenPageConfig({
    @required this.page,
    @required this.icon,
    @required this.title,
    this.actions = const [],
  });
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  final Map<int, HomeScreenPageConfig> pages;

  const HomeScreen({
    Key key,
    @required this.pages,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pages[_pageIndex].title,
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        actions: widget.pages[_pageIndex].actions,
      ),
      body: widget.pages[_pageIndex].page,
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
        children: widget.pages.keys
            .map(
              (pageIndex) => Expanded(
                child: IconButton(
                  onPressed: () => setState(() {
                    _pageIndex = pageIndex;
                  }),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    widget.pages[pageIndex].icon,
                    color: pageIndex == _pageIndex
                        ? primaryColor
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
