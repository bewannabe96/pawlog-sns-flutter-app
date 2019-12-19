import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/screen/util/breed_select_screen.dart';

class NewPetScreen extends StatefulWidget {
  static const routeName = '/settings/edit-family/new-pet';

  NewPetScreen({Key key}) : super(key: key);

  @override
  _NewPetScreenState createState() => _NewPetScreenState();
}

class _NewPetScreenState extends State<NewPetScreen> {
  TextEditingController _nameController;

  File _image;
  Breed _breed;

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
          'New Member',
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: _buildPage(),
    );
  }

  Future<void> _getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> _getBreed() async {
    final selected = await Navigator.of(context)
        .pushNamed(BreedSelectScreen.routeName) as Breed;
    if (selected != null) {
      setState(() {
        _breed = selected;
      });
    }
  }

  Widget _buildPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildContent(),
        FlatButton(
          onPressed: _nameEmpty || _breed == null ? null : () {},
          child: SafeArea(
            child: Text(
              "Save",
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
    );
  }

  Widget _buildContent() {
    final _imageSize = MediaQuery.of(context).size.width * 0.2;

    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              onPressed: _getImage,
              splashColor: Colors.transparent,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  CircleAvatar(
                    radius: _imageSize,
                    backgroundColor: Colors.grey[350],
                    backgroundImage: _image == null ? null : FileImage(_image),
                  ),
                  CircleAvatar(
                    radius: _imageSize * 0.28,
                    backgroundColor: Colors.white,
                    child: const Icon(
                      FontAwesomeIcons.camera,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(_breed?.title ?? 'Select breed'),
                      IconButton(
                        onPressed: _getBreed,
                        icon: const Icon(FontAwesomeIcons.search),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
