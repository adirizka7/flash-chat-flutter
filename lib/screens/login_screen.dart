import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String route = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ), // Container
            ), // Hero
            SizedBox(
              height: 48.0,
            ), // SizedBox
            TextField(
              onChanged: (value) {
                email = email;
              },
              style: TextStyle(
                color: Colors.black,
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: kTextDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ), // TextField
            SizedBox(
              height: 8.0,
            ), // SizedBox
            TextField(
              onChanged: (value) {
                password = password;
              },
              style: TextStyle(
                color: Colors.black,
              ),
              obscureText: true,
              decoration: kTextDecoration.copyWith(
                hintText: 'Enter your password',
              ),
            ), // TextField
            SizedBox(
              height: 24.0,
            ), // SizedBox
            RoundedButton(
              onTap: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.route);
                  }
                } catch (e) {
                  print(e);
                }
              },
              text: 'Log In',
              color: Colors.lightBlueAccent,
            ), // RoundedButton
          ], // <Widget>
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
