import 'package:flutter/material.dart';
import 'package:reachYourGoals/models/goal.dart';
import 'package:reachYourGoals/views/new_goal/goal_name_view.dart';

class NewGoalStartView extends StatefulWidget {
  final Goal goal;
  NewGoalStartView({Key key, @required this.goal}) : super(key: key);

  _NewGoalStartViewState createState() => _NewGoalStartViewState();
}

class _NewGoalStartViewState extends State<NewGoalStartView> {
  int selectedRadio;

  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
      if (selectedRadio == 1) {
        widget.goal.isGood = true;
      } else {
        widget.goal.isGood = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final newGoal = new Goal(null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        title: Text("New Goal"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("New Goal"),
            Padding(
              padding: const EdgeInsets.all(30.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Good Habit?"),
                Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    }),
                Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: Colors.red,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    }),
              ],
            ),
            RaisedButton(
                child: Text("Continue"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewGoalNameView(goal: newGoal),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
