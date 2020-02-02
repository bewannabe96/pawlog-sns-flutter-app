import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/src/style.dart';

class UserSearchResultArea extends StatelessWidget {
  const UserSearchResultArea({Key key}) : super(key: key);

  void _navigateToUserProfile() {
    // TODO: needs implementation
  }

  @override
  Widget build(BuildContext context) {
    return _buildResult(
      context,
      false,
      'queryemail',
      null,
    );
  }

  Widget _buildResult(
    BuildContext context,
    bool found,
    String queryEmail,
    UserSearchResult result,
  ) {
    return found
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 60.0,
                backgroundImage: result.imageURL == null
                    ? const AssetImage('res/asset/user_avatar.png')
                    : NetworkImage(result.imageURL),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  result.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                child: Text(
                  queryEmail,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              FlatButton(
                onPressed: _navigateToUserProfile,
                color: primaryColor,
                splashColor: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'View Profile',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        : Text(
            'User not found.',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18.0,
            ),
          );
  }
}
