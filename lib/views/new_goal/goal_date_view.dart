import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reachYourGoals/models/goal.dart';
import 'dart:async';

import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'goal_confiramtion_view.dart';

class NewGoalDateView extends StatefulWidget {
  final Goal goal;
  NewGoalDateView({Key key, @required this.goal}) : super(key: key);

  @override
  _NewGoalDateViewState createState() => _NewGoalDateViewState();
}

class _NewGoalDateViewState extends State<NewGoalDateView> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  Future displayDateRagePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate,
      initialLastDate: _endDate,
      firstDate: new DateTime(DateTime.now().year - 5),
      lastDate: new DateTime(DateTime.now().year + 5),
    );
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

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
            Text(widget.goal.goalName),
            Text(widget.goal.isGood.toString()),
            RaisedButton(
                child: Text("Pick up the Dates"),
                onPressed: () async {
                  await displayDateRagePicker(context);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    "Start Date: ${DateFormat('yyyy-MM-dd').format(_startDate)}"),
                Text("End Date: ${DateFormat('yyyy-MM-dd').format(_endDate)}"),
              ],
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                widget.goal.startDate = _startDate;
                widget.goal.endDate = _endDate;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NewGoalConfirmationView(goal: widget.goal),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
