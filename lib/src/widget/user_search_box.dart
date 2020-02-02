import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class UserSearchBox extends StatefulWidget {
  const UserSearchBox({Key key}) : super(key: key);

  @override
  _UserSearchBoxState createState() => _UserSearchBoxState();
}

class _UserSearchBoxState extends State<UserSearchBox> {
  TextEditingController _searchController = TextEditingController();

  void _searchUser() {
    if (_searchController.text.length > 0) {
      // TODO: needs implementation
      _searchController.clear();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildInputArea(context),
          _buildSearchButton(context),
        ],
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    final underlineBorder = const UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 1.5),
    );

    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, top: 10.0, right: 20.0, bottom: 40.0),
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'User Email Address',
          labelStyle: const TextStyle(color: darkSecondaryColor),
          enabledBorder: underlineBorder,
          focusedBorder: underlineBorder,
        ),
        cursorColor: accentColor,
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return FlatButton(
      onPressed: _searchUser,
      child: Text(
        'Search',
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      padding: const EdgeInsets.all(15.0),
      shape: const BeveledRectangleBorder(),
      color: primaryColor,
      splashColor: Colors.white12,
    );
  }
}
