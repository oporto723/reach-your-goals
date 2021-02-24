import 'package:flutter/material.dart';
import 'package:reachYourGoals/components/rounded_button.dart';
import 'package:reachYourGoals/services/auth_service.dart';
import 'package:reachYourGoals/widgets/home_widget.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  AuthService _authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/logo.png"),
                  height: size.height * 0.35),
              TextFieldContainer(
                child: TextField(
                  controller: _emailField,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.mail,
                    ),
                    hintText: "Your Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: _passwordField,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                    ),
                    hintText: "Your Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    bool shouldNavigate = await _authService.signIn(
                        _emailField.text, _passwordField.text);
                    if (shouldNavigate) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else
                      // TODO: Create a pop up to indiceate wrong password
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: RoundedButton(
                  text: "REGISTER",
                  press: () async {
                    bool shouldNavigate = await _authService.register(
                        _emailField.text, _passwordField.text);
                    if (shouldNavigate) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TextField container for email and password
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.75,
      decoration: BoxDecoration(
        color: Color(0xffC5E1A5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
