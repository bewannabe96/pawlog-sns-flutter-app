import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';
import 'package:pawlog/src/entity/entity.dart';

import 'package:pawlog/src/container/screen/home_screen.dart';
import 'package:pawlog/src/container/screen/user_profile_screen.dart';

import 'package:pawlog/src/container/widget/user_search_box.dart';
import 'package:pawlog/src/container/widget/user_search_result.dart';

class FriendPage extends StatefulWidget with HomeScreenPage {
  FriendPage({Key key}) : super(key: key);

  @override
  IconData icon() => FontAwesomeIcons.users;

  @override
  String title(BuildContext context) => 'Friend';

  @override
  List<Widget> actionWidgets(BuildContext context) => <Widget>[
        IconButton(
          onPressed: () => Navigator.of(context).push(UserSearchModal()),
          icon: const Icon(FontAwesomeIcons.search),
        ),
      ];

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  // TODO: needs replacement
  List<Friend> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadInitialFriends();
  }

  void _loadInitialFriends() async {
    // TODO: needs implementation
    var jsonstring = await rootBundle.loadString('res/sample/friends.json');
    final json = jsonDecode(jsonstring);

    final entities =
        (json['friends'] as List).map((j) => FriendEntity.fromJson(j)).toList();
    final friends =
        entities.map((entity) => Friend.fromEntity(entity)).toList();

    setState(() {
      _friends = friends;
    });
  }

  void _navigateToUserProfile() {
    Navigator.of(context).pushNamed(UserProfileScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return _friends.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: _friends.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildFriendBuild(context, _friends[index]),
          )
        : _buildEmptyList(context);
  }

  Widget _buildEmptyList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            width: MediaQuery.of(context).size.width * 0.5,
            image: const AssetImage('res/asset/no_friends.png'),
          ),
          Text('No Friends'),
        ],
      ),
    );
  }

  Widget _buildFriendBuild(BuildContext context, Friend friend) {
    return InkWell(
      onTap: _navigateToUserProfile,
      child: ListTile(
        leading: CircleAvatar(
          radius: 27.0,
          backgroundColor: lightSecondaryColor,
          backgroundImage: friend.imageURL == null
              ? const AssetImage('res/asset/user_avatar.png')
              : NetworkImage(friend.imageURL),
        ),
        title: Text(
          friend.name,
          style: const TextStyle(fontSize: 15.0),
        ),
        subtitle: Text(
          friend.email,
          style: const TextStyle(fontSize: 13, color: Colors.black45),
        ),
      ),
    );
  }
}

class UserSearchModal extends ModalRoute<int> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => const Color(0xFF0D0C0C).withOpacity(0.8);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(
        animation.drive(
          CurveTween(curve: Curves.fastLinearToSlowEaseIn),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Search',
            style: Theme.of(context).textTheme.title,
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            UserSearchBox(),
            Expanded(
              child: Center(
                child: UserSearchResultArea(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
