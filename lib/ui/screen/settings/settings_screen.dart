import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/ui/screen/settings/edit_family/edit_family_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  SettingsScreen({Key key}) : super(key: key);

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
            onTap: () {},
          ),
          _MenuRow(
            title: 'Edit Family',
            onTap: () =>
                Navigator.of(context).pushNamed(EditFamilyScreen.routeName),
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
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
