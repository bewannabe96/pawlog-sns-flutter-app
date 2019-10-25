import 'package:flutter/material.dart';

class PetItem extends StatelessWidget {
  const PetItem(this.name, this.breed);

  final String name;
  final String breed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.black26,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
