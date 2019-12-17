import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawlog/bloc/bloc.dart';

class CreateFamilyScreen extends StatelessWidget {
  static const routeName = '/family/create';

  CreateFamilyScreen({Key key}) : super(key: key);

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
            onPressed: () => _onSubmit(context),
            child: SafeArea(
              child: Text(
                "Create",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void _onSubmit(BuildContext context) {
    BlocProvider.of<FamilyBloc>(context).add(CreateFamilyEvent(
      1,
      name: 'Test Family',
    ));
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
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
