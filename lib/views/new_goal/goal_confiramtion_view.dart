import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reachYourGoals/models/goal.dart';
import 'package:reachYourGoals/widgets/home_widget.dart';

// ignore: must_be_immutable
class NewGoalConfirmationView extends StatelessWidget {
  final Goal goal;
  CollectionReference _db = FirebaseFirestore.instance.collection('goals');
  NewGoalConfirmationView({Key key, @required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm your Goal"),
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
                addGoal(goal);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addGoal(Goal goal) {
    return _db.add({
      'goalName': goal.goalName,
      'startDate': goal.startDate,
      'endDate': goal.endDate,
      'isGood': goal.isGood,
    });
  }
}
