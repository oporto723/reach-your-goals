import 'package:flutter/material.dart';
import 'package:reachYourGoals/models/goal.dart';

import 'goal_date_view.dart';

class NewGoalView extends StatefulWidget {
  final Goal goal;
  NewGoalView({Key key, @required this.goal}) : super(key: key);

  @override
  _NewGoalViewState createState() => _NewGoalViewState();
}

class _NewGoalViewState extends State<NewGoalView> {
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
    TextEditingController _titleController = new TextEditingController();
    _titleController.text = widget.goal.goalName;

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
              child: TextField(
                controller: _titleController,
                autofocus: true,
              ),
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
                  widget.goal.goalName = _titleController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewGoalDateView(goal: widget.goal),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
