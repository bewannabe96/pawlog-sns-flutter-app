import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';

class CreateFamilyScreen extends StatefulWidget {
  static const routeName = '/settings/edit-family/create';

  CreateFamilyScreen({Key key}) : super(key: key);

  @override
  _CreateFamilyScreenState createState() => _CreateFamilyScreenState();
}

class _CreateFamilyScreenState extends State<CreateFamilyScreen> {
  TextEditingController _nameController;

  bool _nameEmpty = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.addListener(() {
      setState(() {
        _nameEmpty = _nameController.text.length == 0;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Family',
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildContent(),
          FlatButton(
            onPressed: _nameEmpty ? null : _crateFamily,
            child: SafeArea(
              child: Text(
                "Create",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: Theme.of(context).colorScheme.primary,
            disabledColor: Colors.grey,
            textColor: Colors.white,
            disabledTextColor: Colors.black26,
          ),
        ],
      ),
    );
  }

  void _crateFamily() {
    BlocProvider.of<FamilyBloc>(context).add(
      CreateFamilyEvent(
        name: _nameController.text,
      ),
    );
    Navigator.of(context).pop();
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: 'Family Nickname',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
