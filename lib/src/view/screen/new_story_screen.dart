import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:pawlog/src/style.dart';

import 'package:pawlog/src/view/modal/action_modal.dart';

import 'package:pawlog/src/view/widget/page_submit_button.dart';

class NewStoryScreen extends StatefulWidget {
  static const routeName = '/new-story';

  const NewStoryScreen({Key key}) : super(key: key);

  @override
  _NewStoryScreenState createState() => _NewStoryScreenState();
}

class _NewStoryScreenState extends State<NewStoryScreen> {
  static const _maxImageCount = 5;

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
    if (_images.length >= _maxImageCount) return;

    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _images.add(image);
      setState(() {
        _images = _images;
      });
    }
  }

  void _deleteImage(int index) {
    _images.removeAt(index);
    setState(() {
      _images = _images;
    });
  }

  void _writeStory() {
    // TODO: implement writeStory
  }

  void _showActionModal() {
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
            onPressed: () => _showActionModal(),
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
        _buildImagesCount(),
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
            hintText: 'How is my day today?',
          ),
        ),
      ),
    );
  }

  Widget _buildImagesCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const Icon(
            FontAwesomeIcons.image,
            size: 18,
            color: darkSecondaryColor,
          ),
          SizedBox(width: 5),
          Text(
            '${_images.length} / $_maxImageCount',
            style: const TextStyle(fontSize: 16, color: darkSecondaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesPreview() {
    return Visibility(
      visible: !_keyboardVisible,
      child: SizedBox(
        height: 155,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(bottom: 15),
          itemCount: _images.length + 1,
          itemBuilder: (context, index) => index < _images.length
              ? _buildPreviewImage(index)
              : _buildAddImageButton(),
        ),
      ),
    );
  }

  Widget _buildPreviewImage(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        width: 140,
        height: 140,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              Image(
                fit: BoxFit.cover,
                width: 140,
                height: 140,
                image: FileImage(_images[index]),
              ),
              Container(color: imageOverlayColor),
              Padding(
                padding: const EdgeInsets.all(6),
                child: GestureDetector(
                  onTap: () => _deleteImage(index),
                  child: const Icon(
                    FontAwesomeIcons.times,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddImageButton() {
    return _images.length < _maxImageCount
        ? Container(
            width: 140,
            height: 140,
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
          )
        : SizedBox(width: 15);
  }
}
