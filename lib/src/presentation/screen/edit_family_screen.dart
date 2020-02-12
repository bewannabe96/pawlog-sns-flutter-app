import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/presentation/screen/create_family_screen.dart';
import 'package:pawlog/src/presentation/screen/new_pet_screen.dart';

import 'package:pawlog/src/presentation/modal/action_modal.dart';

import 'package:pawlog/src/presentation/widget/filled_button.dart';
import 'package:pawlog/src/presentation/widget/pet_item.dart';

class EditFamilyScreenProps {
  final Family family;

  const EditFamilyScreenProps({
    @required this.family,
  });
}

class EditFamilyScreen extends StatefulWidget {
  static const routeName = '/edit-family';

  final EditFamilyScreenProps props;

  const EditFamilyScreen({
    Key key,
    @required this.props,
  }) : super(key: key);

  @override
  _EditFamilyScreenState createState() => _EditFamilyScreenState();
}

class _EditFamilyScreenState extends State<EditFamilyScreen> {
  void _navigateToCreateFamily() {
    Navigator.of(context).pushNamed(CreateFamilyScreen.routeName);
  }

  void _navigateToNewPet() {
    Navigator.of(context).pushNamed(NewPetScreen.routeName);
  }

  void _showActionModal() {
    Navigator.of(context).push(
      ActionModal(
        actions: {
          'New Pet': _navigateToNewPet,
        },
      ),
    );
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
        actions: <Widget>[
          IconButton(
            onPressed: _showActionModal,
            icon: const Icon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      body: widget.props.family == null ? _buildNoFamily() : _buildFamilyList(),
    );
  }

  Widget _buildNoFamily() {
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
            onPressed: _navigateToCreateFamily,
            wrapContent: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyList() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ..._buildUserList(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Divider(),
          ),
          ..._buildPetList(),
        ],
      ),
    );
  }

  List<Widget> _buildUserList() {
    final list = <Widget>[
      const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const Text('Owner',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
      ),
    ];

    if (widget.props.family.friends.length > 0) {
      list.addAll(widget.props.family.friends
          .map((friend) => _buildOwnerItem(friend))
          .toList());
    } else {
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: const Text(
              'No owner exists.',
              style: const TextStyle(color: darkSecondaryColor),
            ),
          ),
        ),
      );
    }
    return list;
  }

  List<Widget> _buildPetList() {
    final list = <Widget>[
      const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const Text('Pet',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
      ),
    ];

    if (widget.props.family.pets.length > 0) {
      list.addAll(
          widget.props.family.pets.map((pet) => _buildPetItem(pet)).toList());
    } else {
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: const Text(
              'No pet exists.',
              style: const TextStyle(color: darkSecondaryColor),
            ),
          ),
        ),
      );
    }
    return list;
  }

  Widget _buildOwnerItem(Friend friend) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 27.0,
              backgroundColor: lightSecondaryColor,
              backgroundImage: friend.imageURL == null
                  ? const AssetImage('res/asset/user_avatar.png')
                  : NetworkImage(friend.imageURL),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  friend.name,
                  style: const TextStyle(fontSize: 15.0),
                ),
                SizedBox(height: 5),
                Text(
                  friend.email,
                  style: const TextStyle(fontSize: 13, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetItem(Pet pet) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: PetItem(pet: pet),
      ),
    );
  }
}
