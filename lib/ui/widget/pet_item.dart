import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

class PetItem extends StatelessWidget {
  final Pet pet;

  const PetItem(this.pet);

  @override
  Widget build(BuildContext context) {
    final _syncConfigState = BlocProvider.of<SyncConfigBloc>(context).state;

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
                  pet.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Text(
                _syncConfigState is ConfigLoadedState
                    ? _syncConfigState.config.breedTypes[pet.breed].title
                    : '',
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
