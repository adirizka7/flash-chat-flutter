import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ), // TextStyle
                    ),
                  ],
                ),
              ], // <Widget>
            ), // Row
            SizedBox(
              height: 48.0,
            ), // SizedBox
            ButtonWPadding(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.route);
              },
              text: 'Log In',
              color: Colors.lightBlueAccent,
            ),
            ButtonWPadding(
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.route);
              },
              text: 'Register',
              color: Colors.blueAccent,
            ),
          ], // <Widget>
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}

class ButtonWPadding extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;

  ButtonWPadding({this.onTap, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: this.onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            this.text,
          ), // Text
        ), // MaterialButton
      ), // Material
    ); // Padding
  }
}
