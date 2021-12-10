import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';

class LoginScreen extends StatefulWidget {
  static String route = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: kBaseBorderInputDecoration,
                enabledBorder: kEnabledBorderInputDecoration,
                focusedBorder: kFocusedBorderInputDecoration,
              ), // InputDecoration
            ), // TextField
            SizedBox(
              height: 8.0,
            ), // SizedBox
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your password.',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: kBaseBorderInputDecoration,
                enabledBorder: kEnabledBorderInputDecoration,
                focusedBorder: kFocusedBorderInputDecoration,
              ), // InputDecoration
            ), // TextField
            SizedBox(
              height: 24.0,
            ), // SizedBox
            RoundedButton(
              onTap: () {
                //Implement login functionality.
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
