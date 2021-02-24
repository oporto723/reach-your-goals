import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:reachYourGoals/components/rounded_button.dart';
import 'package:reachYourGoals/constants.dart';
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
        title: Text("Give a Name!!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: newGoalBehaivorCard(_titleController),
                ),
                planetThumbnail,
              ],
            ),
            RoundedButton(
              text: "Continue",
              color: KPrimaryColor,
              press: () {
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

  final planetThumbnail = Container(
    alignment: FractionalOffset.topRight,
    child: Container(
      margin: const EdgeInsets.only(right: 15),
      height: 325.0,
      width: 225.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          // TODO: New to be specific for every goal.
          image: Svg('assets/Name.svg'),
        ),
      ),
    ),
  );

  Container newGoalBehaivorCard(TextEditingController _titleController) {
    return Container(
      height: 275.0,
      margin: EdgeInsets.only(right: 25.0),
      decoration: BoxDecoration(
        color: KPrimaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: "Set Up yout Goal name",
                  border: InputBorder.none,
                  icon: Icon(Icons.nature_people)),
              autofocus: false,
            ),
          ),
        ],
      ),
    );
  }
}
