import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bloc_manager_cluster/bloc_manager_cluster.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/manager/manager.dart';

import 'package:pawlog/rx_screen/home_screen/screen.dart';
import 'package:pawlog/screen/user_profile/screen.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';

import './user_search_modal.dart';

class FriendPage extends StatelessWidget with HomeScreenPage {
  FriendPage({Key key}) : super(key: key);

  @override
  IconData icon() => FontAwesomeIcons.users;

  @override
  String title(BuildContext context) => 'Friend';

  @override
  List<Widget> actionWidgets(BuildContext context) => <Widget>[
        // IconButton(
        //   // onPressed: () => Navigator.of(context).push(UserSearchModal()),
        //   // icon: const Icon(FontAwesomeIcons.search),
        // ),
      ];

  @override
  Widget build(BuildContext context) {
    final friendsManager =
        BlocManagerClusterProvider.of(context).manager<FriendManager>();

    return StateBuilder(
      stateContainer: friendsManager.stateContainer,
      buildOnState: (context, state) => state.friends.length > 0
          ? ListView.builder(
              padding: EdgeInsets.only(bottom: 10),
              itemCount: state.friends.length,
              itemBuilder: (BuildContext context, int index) =>
                  _buildFriendBuild(
                context,
                state.friends[index],
              ),
            )
          : _buildEmptyList(context),
      buildOnWait: (context) => Center(
        child: PLLoading(),
      ),
      buildOnDefault: (context) => PLError(),
    );
  }

  Widget _buildEmptyList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            width: MediaQuery.of(context).size.width * 0.5,
            image: AssetImage('res/asset/no_friends.png'),
          ),
          Text('No Friends')
        ],
      ),
    );
  }

  Widget _buildFriendBuild(BuildContext context, Friend friend) {
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(
        UserProfileScreen.routeName,
        arguments: UserProfileScreenArgs(friend.userID),
      ),
      leading: CircleAvatar(
        radius: 27,
        backgroundColor: Colors.black26,
        backgroundImage: friend.imageURL == null
            ? AssetImage('res/asset/user_avatar.png')
            : NetworkImage(friend.imageURL),
      ),
      title: Text(
        friend.name,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        friend.email,
        style: TextStyle(
          fontSize: 13,
          color: Colors.black45,
        ),
      ),
    );
  }
}
