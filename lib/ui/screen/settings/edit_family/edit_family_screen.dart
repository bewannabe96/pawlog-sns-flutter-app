import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';
import 'package:pawlog/ui/component/pl_loading.dart';
import 'package:pawlog/ui/screen/settings/edit_family/create_family.dart';
import 'package:pawlog/ui/screen/settings/edit_family/new_pet_screen.dart';
import 'package:pawlog/ui/widget/pet_item.dart';

class EditFamilyScreen extends StatelessWidget {
  static const routeName = '/settings/edit-family';

  EditFamilyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Family',
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(NewPetScreen.routeName),
            icon: const Icon(FontAwesomeIcons.plus),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocBuilder<FamilyBloc, FamilyState>(
      builder: (BuildContext context, FamilyState state) {
        if (state is FamilyLoadedState) {
          return Center(
            child: _buildList(context, state.family),
          );
        } else if (state is FamilyLoadingState) {
          return PLLoading();
        } else {
          return PLError();
        }
      },
    );
  }

  Widget _buildList(BuildContext context, Family family) {
    if (family == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            width: MediaQuery.of(context).size.width * 0.4,
            image: AssetImage('res/asset/no_family.jpeg'),
          ),
          FlatButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(CreateFamilyScreen.routeName),
            child: Text(
              "Create Family",
              style: TextStyle(fontSize: 18.0),
            ),
            textColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      );
    } else if (family.pets.length == 0) {
      return const Text('No family member exist');
    } else {
      return ListView.builder(
        itemCount: family.pets.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildPetItem(family.pets[index]),
      );
    }
  }

  Widget _buildPetItem(Pet pet) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: PetItem(pet),
      ),
    );
  }
}
