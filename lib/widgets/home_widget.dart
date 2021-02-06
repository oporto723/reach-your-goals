import 'package:flutter/material.dart';
import 'package:reachYourGoals/models/goal.dart';
import 'package:reachYourGoals/views/home_view.dart';
import 'package:reachYourGoals/views/new_goal/goal_start_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final newGoal = new Goal(null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Reach your Goals"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewGoalView(goal: newGoal),
                ),
              );
            },
          ),
        ],
      ),
      body: HomeView(),
    );
  }
}
