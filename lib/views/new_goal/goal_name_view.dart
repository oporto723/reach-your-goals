import 'package:flutter/material.dart';
import 'package:reachYourGoals/models/goal.dart';

import 'goal_date_view.dart';

class NewGoalNameView extends StatelessWidget {
  final Goal goal;
  NewGoalNameView({Key key, @required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();
    _titleController.text = goal.goalName;

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
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                goal.goalName = _titleController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewGoalDateView(goal: goal),
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

// class NewGoalNameView extends StatelessWidget {
//   @override
//     TextEditingController _titleController = new TextEditingController();
//     _titleController.text = widget.goal.goalName;

//   return Scaffold(
//     appBar: AppBar(
//       title: Text("New Goal"),
//     ),
//     body: Center(
//       child: Column(
//         children: <Widget>[
//           Text("New Goal"),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: TextField(
//               controller: _titleController,
//               autofocus: true,
//             ),
//           ),
//           RaisedButton(
//               child: Text("Continue"),
//               onPressed: () {
//                 widget.goal.goalName = _titleController.text;
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => NewGoalDateView(goal: widget.goal),
//                   ),
//                 );
//               }),
//         ],
//       ),
//     ),
//   );
// }
