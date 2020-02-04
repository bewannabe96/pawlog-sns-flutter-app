import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/modal/action_modal.dart';

import 'package:pawlog/src/widget/page_submit_button.dart';

class NewStoryScreen extends StatefulWidget {
  static const routeName = '/new-story';

  const NewStoryScreen({Key key}) : super(key: key);

  @override
  _NewStoryScreenState createState() => _NewStoryScreenState();
}

class _NewStoryScreenState extends State<NewStoryScreen> {
  final TextEditingController _contentController = TextEditingController();

  bool _keyboardVisible = false;

  bool _contentFilled = false;

  List<File> _images = [];

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
    _contentController.addListener(
      () => setState(() {
        _contentFilled = _contentController.text.length > 0;
      }),
    );
  }

  Future<void> _getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _images.add(image);
      setState(() {
        _images = _images;
      });
    }
  }

  void _writeStory() {
    // TODO: implement writeStory
  }

  void _showActionModal(BuildContext context) {
    Navigator.of(context).push(
      ActionModal(
        actions: {
          'Add Image': _getImage,
        },
      ),
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () => _showActionModal(context),
            icon: const Icon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: const AssetImage('res/asset/user_avatar.png'),
          ),
          title: Text('Sookhyun', style: const TextStyle(fontSize: 17.0)),
        ),
        _buildContentForm(),
        _buildImagesPreview(),
        PageSubmitButton(
          onPressed: _contentFilled || _images.length > 0 ? _writeStory : null,
          label: 'Post',
        ),
      ],
    );
  }

  Widget _buildContentForm() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: TextField(
          controller: _contentController,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Write your content...',
          ),
        ),
      ),
    );
  }

  Widget _buildImagesPreview() {
    return Visibility(
      visible: !_keyboardVisible,
      child: SizedBox(
        height: 170,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemCount: _images.length + 1,
          itemBuilder: (context, index) => index < _images.length
              ? _buildPreviewImage(_images[index])
              : _buildAddImageButton(),
        ),
      ),
    );
  }

  Widget _buildPreviewImage(File image) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Image(
              fit: BoxFit.cover,
              width: 140,
              height: 140,
              image: FileImage(image),
            ),
            Container(
              width: 140,
              height: 140,
              color: imageOverlayColor,
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: const Icon(
                FontAwesomeIcons.times,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddImageButton() {
    return Container(
      width: 130,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: placeholderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: _getImage,
        child: const Icon(
          FontAwesomeIcons.plus,
          color: placeholderAccentColor,
        ),
      ),
    );
  }
}
