import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/view/widget/pet_item.dart';

class ProfileFamilyList extends StatelessWidget {
  final Family family;

  const ProfileFamilyList({@required this.family});

  @override
  Widget build(BuildContext context) {
    return family == null ? _noFamily(context) : _buildFamilyInfo(context);
  }

  Widget _noFamily(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: const Text(
          'No family exists.',
          style: TextStyle(color: darkSecondaryColor),
        ),
      ),
    );
  }

  Widget _buildFamilyInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Text(
            family.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        family.pets.length > 0
            ? Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: (family.pets
                      .map((value) => _buildFamilyItem(context, value))
                      .toList()),
                ),
              )
            : _buildNoFamilyMember(context),
      ],
    );
  }

  Widget _buildFamilyItem(BuildContext context, Pet pet) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: PetItem(pet: pet),
      ),
    );
  }

  Widget _buildNoFamilyMember(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Center(
        child: const Text(
          'No pet exists.',
          style: const TextStyle(color: darkSecondaryColor),
        ),
      ),
    );
  }
}
