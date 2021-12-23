import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String route = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ), // Container
                ), // Hero
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      speed: Duration(milliseconds: 250),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ), // TextStyle
                    ), // TypewriterAnimatedText
                  ], // animatedTexts:
                ), // AnimatedTextKit
              ], // <Widget>
            ), // Row
            SizedBox(
              height: 48.0,
            ), // SizedBox
            RoundedButton(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.route);
              },
              text: 'Log In',
              color: Colors.lightBlueAccent,
            ), // RoundedButton
            RoundedButton(
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.route);
              },
              text: 'Register',
              color: Colors.blueAccent,
            ), // RoundedButton
          ], // <Widget>
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
