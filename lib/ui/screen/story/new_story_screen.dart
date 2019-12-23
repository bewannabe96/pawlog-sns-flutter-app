import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:pawlog/ui/component/pl_page_indicator.dart';

class NewStoryScreen extends StatefulWidget {
  static const routeName = '/story/new';

  const NewStoryScreen({Key key}) : super(key: key);

  @override
  _NewStoryScreenState createState() => _NewStoryScreenState();
}

class _NewStoryScreenState extends State<NewStoryScreen> {
  bool _keyboardVisible = false;

  PageController _pageController;

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
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Story',
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
      _images.add(image);
      setState(() {
        _images = _images;
      });
    }
  }

  Widget _buildPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildImageUploader(),
        _buildContentForm(),
        FlatButton(
          onPressed: () {},
          child: SafeArea(
            child: Text(
              "Post",
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

  Widget _buildImageUploader() {
    final List<Widget> _pages = [];

    _pages.addAll(_images.map((img) => Image(image: FileImage(img))));
    _pages.add(
      FlatButton(
        onPressed: _getImage,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                FontAwesomeIcons.plusCircle,
                size: 70.0,
              ),
              const Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  'Add Image',
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Visibility(
      visible: !_keyboardVisible,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width,
            child: PageView(
              controller: _pageController,
              children: _pages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: PLPageIndicator(
                controller: _pageController,
                count: _images.length + 1,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildContentForm() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: TextField(
          minLines: 50,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Write your content...',
          ),
        ),
      ),
    );
  }
}
