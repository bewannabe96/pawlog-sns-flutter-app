import 'package:flutter/material.dart';

class AuthTitleText extends StatelessWidget {
  const AuthTitleText(
    this.title,
    this.description, {
    Key key,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.5,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: underlineBorder,
          focusedBorder: underlineBorder,
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
