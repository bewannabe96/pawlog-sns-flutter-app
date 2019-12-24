import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/modal/pet_info_modal.dart';
import 'package:pawlog/ui/widget/pet_item.dart';

class ProfileFamilyList extends StatelessWidget {
  final Family family;

  const ProfileFamilyList(this.family);

  @override
  Widget build(BuildContext context) {
    return family == null ? _noFamily(context) : _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
          child: Text(
            family.name,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: (family.pets
                .map((value) => _buildFamilyItem(context, value))
                .toList()),
          ),
        )
      ],
    );
  }

  Widget _noFamily(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text(
          'No family exists.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildFamilyItem(BuildContext context, Pet pet) {
    return InkWell(
      onTap: () => Navigator.of(context).push(PetInfoModal(pet)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: PetItem(pet),
      ),
    );
  }
}
