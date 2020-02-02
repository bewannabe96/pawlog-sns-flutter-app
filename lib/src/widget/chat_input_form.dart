import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/src/style.dart';

class ChatInputForm extends StatefulWidget {
  final Function(String) onEnter;

  const ChatInputForm({
    this.onEnter,
  });

  @override
  _ChatInputFormState createState() => _ChatInputFormState();
}

class _ChatInputFormState extends State<ChatInputForm> {
  final TextEditingController _controller = TextEditingController();

  bool _buttonActive = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _buttonActive = _controller.text.length > 0;
      });
    });
  }

  _onEnter() {
    widget.onEnter(_controller.text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          const BoxShadow(color: Colors.black12, blurRadius: 1.0)
        ],
      ),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: _buttonActive ? _onEnter : null,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                color: _buttonActive ? primaryColor : Colors.grey,
                child: Icon(
                  FontAwesomeIcons.solidPaperPlane,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
