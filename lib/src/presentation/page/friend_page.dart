import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/screen/user_profile_screen.dart';

class FriendPage extends StatefulWidget {
  final List<Friend> friends;

  FriendPage({Key key, @required this.friends}) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  void _navigateToUserProfile() {
    Navigator.of(context).pushNamed(UserProfileScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return widget.friends.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: widget.friends.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildFriendBuild(context, widget.friends[index]),
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
