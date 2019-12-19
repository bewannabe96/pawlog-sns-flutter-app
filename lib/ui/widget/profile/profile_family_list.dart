import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/widget/pet_item.dart';

class ProfileFamilyList extends StatelessWidget {
  final Family family;

  const ProfileFamilyList(this.family) : assert(family != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            family.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: (family.pets
                  .map((value) => _buildFamilyItem(value))
                  .toList()),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFamilyItem(Pet pet) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: PetItem(pet),
      ),
    );
  }
}
