import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          width: double.infinity,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/home'),
                child: const Text("Login"),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pushNamed('/signup'),
                child: const Text("Sign Up"),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          )),
    );
  }
}
