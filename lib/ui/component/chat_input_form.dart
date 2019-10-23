import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatInputForm extends StatefulWidget {
  const ChatInputForm({
    this.onEnter,
  });

  final Function(String message) onEnter;

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
        _buttonActive = _controller.text != '';
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onEnter() {
    widget.onEnter(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final textInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Theme.of(context).colorScheme.secondaryVariant,
      ),
      borderRadius: BorderRadius.circular(30),
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  border: textInputBorder,
                  focusedBorder: textInputBorder,
                ),
              ),
            ),
            IconButton(
              onPressed: _buttonActive ? _onEnter : null,
              icon: const Icon(FontAwesomeIcons.solidArrowAltCircleRight),
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
