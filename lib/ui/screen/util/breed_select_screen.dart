import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_error.dart';

class BreedSelectScreen extends StatefulWidget {
  static const routeName = '/util/breed-select';

  BreedSelectScreen({Key key}) : super(key: key);

  @override
  _BreedSelectScreen createState() => _BreedSelectScreen();
}

class _BreedSelectScreen extends State<BreedSelectScreen> {
  TextEditingController _searchWordController;

  bool _searchWordEmpty = true;

  @override
  void initState() {
    super.initState();
    _searchWordController = TextEditingController();

    _searchWordController.addListener(() {
      setState(() {
        _searchWordEmpty = _searchWordController.text.length == 0;
      });
    });
  }

  @override
  void dispose() {
    _searchWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.times),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          _buildSearchBox(),
          _buildResult(),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.only(
        top: 5.0,
        right: 10.0,
        bottom: 5.0,
        left: 20.0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _searchWordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search breed',
              ),
            ),
          ),
          Visibility(
            visible: !_searchWordEmpty,
            child: IconButton(
              onPressed: () => _searchWordController.clear(),
              icon: const Icon(Icons.close),
              splashColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult() {
    final state = BlocProvider.of<SyncConfigBloc>(context).state;

    if (state is ConfigLoadedState) {
      final breeds = state.config.breedTypes;

      return Expanded(
        child: ListView.builder(
          itemCount: breeds.length,
          itemBuilder: (BuildContext context, int index) => _buildResultItem(
            context,
            breeds[index],
          ),
        ),
      );
    } else {
      return PLError();
    }
  }

  Widget _buildResultItem(BuildContext context, Breed breed) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(breed),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              breed.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
