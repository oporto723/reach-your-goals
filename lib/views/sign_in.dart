import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reachYourGoals/services/auth_service.dart';
import 'package:reachYourGoals/widgets/home_widget.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  AuthService _authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        child: DecoratedBox(
          decoration: new BoxDecoration(
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                    controller: _emailField, decoration: InputDecoration()),
                TextFormField(
                  controller: _passwordField,
                ),
                RaisedButton(
                  onPressed: () async {
                    bool shouldNavigate = await _authService.register(
                        _emailField.text, _passwordField.text);
                    if (shouldNavigate) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                  child: Text('Register'),
                ),
                RaisedButton(
                  onPressed: () async {
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
                  child: Text('sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
