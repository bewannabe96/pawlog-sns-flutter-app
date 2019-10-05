import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'discover_page.dart';
import 'friends_page.dart';
import 'message_page.dart';
import 'profile_page.dart';

void main() => runApp(PawlogApp());

class PawlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'PetMe',
      theme: ThemeData(
        // Colors
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
        // Fonts
        fontFamily: 'Arial',
        textTheme: TextTheme(),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  final List<Map<String, Object>> _pages = const <Map<String, Object>>[
    {'title': 'Discover', 'content': const DiscoverPage()},
    {'title': 'Friends', 'content': const FriendsPage()},
    {'title': 'Message', 'content': const MessagePage()},
    {'title': 'Profile', 'content': const ProfilePage()},
  ];

  void _incrementTab(index) {
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
      body: Center(
        child: _pages[_pageIndex]['content'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.solidCompass),
            title: Text(_pages[0]['title'] as String),
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.users),
            title: Text(_pages[1]['title'] as String),
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.solidComments),
            title: Text(_pages[2]['title'] as String),
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.solidUserCircle),
            title: Text(_pages[3]['title'] as String),
          )
        ],
        onTap: (index) {
          _incrementTab(index);
        },
      ),
    );
  }
}
