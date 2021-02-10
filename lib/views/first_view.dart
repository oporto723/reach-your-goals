import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:reachYourGoals/widgets/home_widget.dart';
import 'package:sign_button/sign_button.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(10, 40, 10, 20),
                child:
                    Image(image: AssetImage("assets/logo.png"), height: 220)),
            RichText(
              text: TextSpan(
                  style: GoogleFonts.alegreya(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  text: "This is the starting ",
                  children: <TextSpan>[
                    TextSpan(
                        text: "POINT,",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
            ),
            RichText(
              text: TextSpan(
                  style: GoogleFonts.alegreya(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  text: "to set up your ",
                  children: <TextSpan>[
                    TextSpan(
                        text: "FUTURE,",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
            ),
            RichText(
              text: TextSpan(
                  style: GoogleFonts.alegreya(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  text: "start with small ",
                  children: <TextSpan>[
                    TextSpan(
                        text: "GOALS,",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0, 30, 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: GoogleFonts.alegreya(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    text: "track them, set remainders and share you ",
                    children: <TextSpan>[
                      TextSpan(
                          text: "SUCCESS!!!!",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
              ),
            ),
            SizedBox(
              height: 55.0,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SignInButton(
                  buttonType: ButtonType.google,
                  //buttonSize: ButtonSize.large,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SignInButton(
                  buttonType: ButtonType.apple,
                  //  buttonSize: ButtonSize.large,
                  onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SignInButton(
                  buttonType: ButtonType.mail,
                  //  buttonSize: ButtonSize.large,
                  onPressed: () {}),
            ),
            AutoSizeText(
              "Don't have an account? Sign Up.",
              textAlign: TextAlign.center,
              style: GoogleFonts.alegreya(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
