import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pawlog/src/model/model.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/widget/page_submit_button.dart';
import 'package:pawlog/src/widget/text_field.dart';

class NewPetScreen extends StatefulWidget {
  static const routeName = '/new-pet';

  NewPetScreen({Key key}) : super(key: key);

  @override
  _NewPetScreenState createState() => _NewPetScreenState();
}

class _NewPetScreenState extends State<NewPetScreen> {
  final TextEditingController _nameController = TextEditingController();

  File _image;
  Breed _breed;

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

  Future<void> _getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  void _getBreed() {
    // TODO: implement getBreed
  }

  void _registerPet() {
    // TODO: implement registerPet
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

  Widget _buildPage() {
    return Column(
      children: <Widget>[
        _buildContent(),
        PageSubmitButton(
          onPressed: _nameFilled && _breed != null ? _registerPet : null,
          label: 'Save',
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: _getImage,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  backgroundImage: _image == null ? null : FileImage(_image),
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundColor: imageOverlayColor,
                ),
                const Icon(
                  FontAwesomeIcons.camera,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          PLTextField(
            controller: _nameController,
            label: 'Name',
          ),
        ],
      ),
    );
  }
}
