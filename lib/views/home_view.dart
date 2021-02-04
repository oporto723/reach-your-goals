import 'package:flutter/material.dart';
import '../models/goal.dart';

class HomeView extends StatelessWidget {
// Create a list of Goals, local, to check how looks
  final List<Goal> goalsList = [
    Goal("Run once a week", DateTime.now(), DateTime.now(), true),
    Goal("Cook 3 days", DateTime.now(), DateTime.now(), true),
    Goal("Stop to Smoke", DateTime.now(), DateTime.now(), true)
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
