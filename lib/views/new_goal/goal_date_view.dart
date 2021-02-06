import 'package:flutter/material.dart';
import 'package:reachYourGoals/models/goal.dart';

import 'goal_confiramtion_view.dart';

class NewGoalDateView extends StatelessWidget {
  final Goal goal;
  NewGoalDateView({Key key, @required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set up the Date"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(goal.goalName),
            Text(goal.isGood.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Enter a Start Date"),
                Text("Enter a End Date"),
              ],
            ),
            RaisedButton(
                child: Text("Continue"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewGoalConfirmationView(goal: goal),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
