import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/screen/create_family_screen.dart';

import 'package:pawlog/src/presentation/widget/filled_button.dart';

class EditFamilyScreen extends StatelessWidget {
  static const routeName = '/edit-family';

  EditFamilyScreen({Key key}) : super(key: key);

  void _navigateToCreateFamily(BuildContext context) {
    Navigator.of(context).pushNamed(CreateFamilyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Family',
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: _buildPage(context, null),
    );
  }

  Widget _buildPage(BuildContext context, Family family) {
    return family == null
        ? _buildNoFamily(context)
        : _buildList(context, family);
  }

  Widget _buildNoFamily(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            width: MediaQuery.of(context).size.width * 0.5,
            image: const AssetImage('res/asset/create_family.png'),
          ),
          SizedBox(height: 25),
          Text(
            'Organize Your Family',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          PLFilledButton(
            label: 'Create Family',
            onPressed: () => _navigateToCreateFamily(context),
            wrapContent: true,
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, Family family) {
    if (family.pets.length == 0) {
      return const Text('No family member exist');
    } else {
      return ListView.builder(
        itemCount: family.pets.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildPetItem(family.pets[index]),
      );
    }
  }

  Widget _buildPetItem(Pet pet) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Container(),
      ),
    );
  }
}
