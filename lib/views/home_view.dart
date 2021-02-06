import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:reachYourGoals/models/goal.dart';

class HomeView extends StatelessWidget {
// Create a list of Goals, local, to check how looks the final result
  final List<Goal> goalsList = [
    Goal("Run once a week", DateTime.now(), DateTime.now(), true),
    Goal("Cook 3 days", DateTime.now(), DateTime.now(), false),
    Goal("Stop to Smoke", DateTime.now(), DateTime.now(), true)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemCount: goalsList.length,
        itemBuilder: (BuildContext context, int index) =>
            buildGoalCard(context, index),
      ),
    );
  }

  Widget buildGoalCard(BuildContext context, int index) {
    final goal = goalsList[index];
    return new Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Text(goal.goalName),
            Text(DateFormat('yyyy-MM-dd').format(goal.startDate)),
            Text(DateFormat('yyyy-MM-dd').format(goal.endDate)),
            Text(goal.isGood.toString()),
          ],
        ),
      ),
    );
  }
}
