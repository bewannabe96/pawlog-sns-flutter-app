import 'package:flutter/material.dart';

import 'package:pawlog/src/container/widget/page_submit_button.dart';
import 'package:pawlog/src/container/widget/text_field.dart';

class CreateFamilyScreen extends StatefulWidget {
  static const routeName = '/create-family';

  CreateFamilyScreen({Key key}) : super(key: key);

  @override
  _CreateFamilyScreenState createState() => _CreateFamilyScreenState();
}

class _CreateFamilyScreenState extends State<CreateFamilyScreen> {
  final TextEditingController _nameController = TextEditingController();

  bool _nameFilled = false;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      setState(() {
        _nameFilled = _nameController.text.length > 0;
      });
    });
  }

  void _createFamily() {
    // TODO: implement createFamily
    Navigator.of(context).pop();
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: PLTextField(
              controller: _nameController,
              label: 'Family Nickname',
            ),
          ),
          PageSubmitButton(
            onPressed: _nameFilled ? _createFamily : null,
            label: 'Create',
          ),
        ],
      ),
    );
  }
}
