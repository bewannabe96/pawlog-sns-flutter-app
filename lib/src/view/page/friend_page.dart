import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/view/screen/profile_screen.dart';

class FriendPageProps {
  final List<Friend> friends;

  const FriendPageProps({
    @required this.friends,
  });
}

class FriendPage extends StatefulWidget {
  final FriendPageProps props;

  const FriendPage({
    Key key,
    @required this.props,
  }) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  void _navigateToUserProfile() {
    Navigator.of(context).pushNamed(ProfileScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return widget.props.friends.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: widget.props.friends.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildFriendBuild(context, widget.props.friends[index]),
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
