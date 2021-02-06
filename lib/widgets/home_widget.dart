import 'package:flutter/material.dart';
import 'package:reachYourGoals/views/home_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reach your Goals"),
      ),
      body: HomeView(),
    );
  }
}
