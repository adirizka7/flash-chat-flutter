import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String route = '/register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  String email = 'NaN';
  String password = 'NaN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ), // Container
                ), // Hero
              ), // Flexible
              SizedBox(
                height: 48.0,
              ), // SizedBox
              TextField(
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(
                  color: Colors.black,
                ), // TextStyle
                keyboardType: TextInputType.emailAddress,
                decoration: kTextDecoration.copyWith(
                  hintText: 'Enter your email',
                ), // kTextDecoration.copyWith
              ), // TextField
              SizedBox(
                height: 8.0,
              ), // SizedBox
              TextField(
                onChanged: (value) {
                  password = value;
                },
                style: TextStyle(
                  color: Colors.black,
                ), // TextStyle
                obscureText: true,
                decoration: kTextDecoration.copyWith(
                  hintText: 'Enter your password',
                ), // kTextDecoration.copyWith
              ), // TextField
              SizedBox(
                height: 24.0,
              ), // SizedBox
              RoundedButton(
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.route);
                    }
                  } catch (e) {
                    print(e);
                  }

                  setState(() {
                    showSpinner = false;
                  });
                },
                text: 'Register',
                color: Colors.blueAccent,
              ), // RoundedButton
            ], // <Widget>
          ), // Column
        ), // Padding
      ), // ModalProgressHUD
    ); // Scaffold
  }
}
