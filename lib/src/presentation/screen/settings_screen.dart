import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/presentation/screen/edit_family_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  SettingsScreen({Key key}) : super(key: key);

  void _navigateToEditProfile(BuildContext context) {
    // TODO: implement navigateToEditProfile
  }

  void _navigateToEditFamily(BuildContext context) {
    Navigator.of(context).pushNamed(EditFamilyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          _MenuRow(
            title: 'Edit Profile',
            onTap: () => _navigateToEditProfile(context),
          ),
          _MenuRow(
            title: 'Edit Family',
            onTap: () => _navigateToEditFamily(context),
          ),
          _InfoRow(title: 'Current version', value: '1.0.0'),
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  final String title;
  final Function onTap;

  const _MenuRow({
    @required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: const TextStyle(fontSize: 18)),
            const Icon(FontAwesomeIcons.angleRight),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const _InfoRow({
    @required this.title,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: const TextStyle(fontSize: 18)),
          Text(
            value,
            style: TextStyle(fontSize: 18, color: darkSecondaryColor),
          ),
        ],
      ),
    );
  }
}
