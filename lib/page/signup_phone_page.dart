import 'package:flutter/material.dart';

class SignupPhonePage extends StatefulWidget {
  const SignupPhonePage({Key key}) : super(key: key);

  @override
  _SignupPhonePageState createState() => _SignupPhonePageState();
}

class _SignupPhonePageState extends State<SignupPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Verifying your phone number',
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Phone number'),
              ),
            )
          ],
        ));
  }
}
