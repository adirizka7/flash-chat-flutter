import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;

  RoundedButton({this.onTap, this.text, this.color});

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
