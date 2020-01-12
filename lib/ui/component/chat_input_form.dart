import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatInputForm extends StatefulWidget {
  final Function(String message) onEnter;

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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 0.5,
          ),
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
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: _buttonActive ? _onEnter : null,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                color: Theme.of(context).colorScheme.primary,
                child: const Icon(
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
