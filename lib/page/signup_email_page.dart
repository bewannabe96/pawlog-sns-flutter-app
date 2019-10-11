import 'package:flutter/material.dart';

class SignupEmailPage extends StatefulWidget {
  const SignupEmailPage({Key key}) : super(key: key);

  @override
  _SignupEmailPageState createState() => _SignupEmailPageState();
}

class _SignupEmailPageState extends State<SignupEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter your email',
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Email Address'),
              ),
            )
          ],
        ));
  }
}
