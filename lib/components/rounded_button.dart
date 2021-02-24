import 'package:flutter/material.dart';

// RoundedButton widget

//TODO: Get the color outside as a constant with the theme color
class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  const RoundedButton({Key key, this.text, this.press, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          color: color,
          onPressed: press,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
