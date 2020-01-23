import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearchBox extends StatefulWidget {
  UserSearchBox({Key key}) : super(key: key);

  @override
  _UserSearchBoxState createState() => _UserSearchBoxState();
}

class _UserSearchBoxState extends State<UserSearchBox> {
  TextEditingController _searchController = TextEditingController();

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
    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 1.5,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 10.0,
        right: 20.0,
        bottom: 40.0,
      ),
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'User Email Address',
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
          enabledBorder: underlineBorder,
          focusedBorder: underlineBorder,
        ),
        cursorColor: Theme.of(context).colorScheme.primaryVariant,
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    final searchUserByEmail = () {
      if (_searchController.text.length > 0) {
        // BlocProvider.of<UserSearchBloc>(context).add(
        //   SearchByEmailRequested(email: _searchController.text),
        // );
        _searchController.clear();
      }
    };

    return FlatButton(
      onPressed: searchUserByEmail,
      child: Text(
        'Search',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      padding: const EdgeInsets.all(15.0),
      shape: BeveledRectangleBorder(),
      color: Theme.of(context).colorScheme.primary,
      splashColor: Colors.white12,
    );
  }
}
