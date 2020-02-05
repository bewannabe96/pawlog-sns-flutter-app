import 'package:flutter/material.dart';

import 'package:pawlog/src/model/model.dart';

class PetItem extends StatelessWidget {
  final Pet pet;

  const PetItem({@required this.pet});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 27,
            backgroundColor: Colors.black26,
            backgroundImage:
                pet.imageURL == null ? null : NetworkImage(pet.imageURL),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  pet.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
