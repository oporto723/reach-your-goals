import 'package:flutter/material.dart';
import 'package:reachYourGoals/models/goal.dart';

class NewGoalConfirmationView extends StatelessWidget {
  final Goal goal;
  NewGoalConfirmationView({Key key, @required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm your Goals"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Final Card"),
            Card(
              margin: EdgeInsets.all(25),
              elevation: 5,
              color: Colors.red[200],
              child: Padding(
                padding: EdgeInsets.all(100),
                child: Text(goal.goalName),
              ),
            ),
            Text("CONFIRM"),
            RaisedButton(
              onPressed: () {
                // Here is where we saved in Firebase
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
