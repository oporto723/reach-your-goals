import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          onPressed: press,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: Color(0xff795548),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
