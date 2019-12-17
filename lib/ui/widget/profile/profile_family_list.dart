import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/modal/new_family_modal.dart';
import 'package:pawlog/ui/widget/pet_item.dart';

class ProfileFamilyList extends StatelessWidget {
  final Family family;

  const ProfileFamilyList(this.family);

  @override
  Widget build(BuildContext context) {
    if (family is Family) {
      return _buildFamily();
    } else {
      return FlatButton(
        onPressed: () => Navigator.of(context).push(NewFamilyModal()),
        child: Text(
          "New Family",
          style: TextStyle(fontSize: 18.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        textColor: Theme.of(context).colorScheme.primary,
      );
    }
  }

  Widget _buildFamily() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Family',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(FontAwesomeIcons.plus),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: (family.pets
                  .map((Pet pet) => _buildFamilyItem(pet.name, pet.breed))
                  .toList()),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFamilyItem(String name, String breed) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: PetItem(name, breed),
      ),
    );
  }
}
