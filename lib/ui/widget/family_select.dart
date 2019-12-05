import 'package:flutter/material.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_checkbox.dart';
import 'package:pawlog/ui/component/pl_filled_button.dart';
import 'package:pawlog/ui/widget/pet_item.dart';

class FamilySelect extends StatefulWidget {
  final List<Pet> family;
  final Function(List<Pet>) onSubmit;

  FamilySelect({
    Key key,
    @required this.family,
    @required this.onSubmit,
  }) : super(key: key);

  @override
  _FamilySelectState createState() => _FamilySelectState();
}

class _FamilySelectState extends State<FamilySelect> {
  Map<int, bool> _family = {};

  @override
  void initState() {
    super.initState();
    widget.family.forEach((Pet pet) {
      _family[pet.petID] = false;
    });
  }

  void onSubmit() {
    List<Pet> selected = [];
    widget.family.forEach((Pet pet) {
      if (_family[pet.petID]) {
        selected.add(pet);
      }
    });
    widget.onSubmit(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: widget.family
                .map(
                  (Pet member) => _buildPetItem(
                    name: member.name,
                    breed: member.breed,
                    checked: _family[member.petID],
                    onChanged: (value) {
                      setState(() {
                        _family[member.petID] = value;
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: PLFilledButton(
            title: 'Start Meetup',
            onPressed: onSubmit,
          ),
        ),
      ],
    );
  }

  Widget _buildPetItem({
    name,
    breed,
    checked,
    onChanged,
  }) {
    return InkWell(
      onTap: () {
        onChanged(!checked);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PLCheckbox(
                value: checked,
              ),
            ),
            Expanded(
              child: PetItem(name, breed),
            ),
          ],
        ),
      ),
    );
  }
}
