import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:reachYourGoals/constants.dart';
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
    return Center(
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

  final planetThumbnail = Container(
    margin: EdgeInsets.symmetric(vertical: 15.0),
    alignment: FractionalOffset.centerLeft,
    child: Container(
      height: 100.0,
      width: 125.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          // TODO: New to be specific for every goal.
          image: Svg('assets/Hiking.svg'),
        ),
      ),
    ),
  );

  final planetCard = Container(
    height: 125.0,
    margin: EdgeInsets.only(left: 45.0),
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
          padding: const EdgeInsets.all(8.0),
          child: Container(color: KPrimaryColor),
        ),
        Text('Goal Name'),
        Text('Date')
      ],
    ),
  );
}
