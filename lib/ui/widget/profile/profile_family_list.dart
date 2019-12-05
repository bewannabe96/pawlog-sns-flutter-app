import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/model/model.dart';
import 'package:pawlog/ui/component/pl_outlined_button.dart';

import 'package:pawlog/ui/widget/pet_item.dart';

class ProfileFamilyList extends StatelessWidget {
  final List<Pet> family;

  const ProfileFamilyList(this.family);

  @override
  Widget build(BuildContext context) {
    if (family is List<Pet>) {
      return _buildFamily();
    } else {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: PLOutlinedButton(
          title: 'Create My Family',
        ),
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
              children: (family.map((Pet pet) => _buildFamilyItem()).toList()),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFamilyItem() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: PetItem('test', 'test'),
      ),
    );
  }
}
