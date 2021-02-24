import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return new Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }

  final planetThumbnail = new Container(
    margin: new EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: Container(
      height: 92.0,
      width: 92.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: new NetworkImage('https://googleflutter.com/sample_image.jpg'),
        ),
      ),
    ),
  );

  final planetCard = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(color: new Color(0xFF333366)),
    ),
  );
}
