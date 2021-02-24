import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:reachYourGoals/components/rounded_button.dart';
import 'package:reachYourGoals/constants.dart';
import 'package:reachYourGoals/models/goal.dart';
import 'package:reachYourGoals/views/new_goal/goal_name_view.dart';

class NewGoalStartView extends StatefulWidget {
  final Goal goal;

  NewGoalStartView({Key key, @required this.goal}) : super(key: key);

  _NewGoalStartViewState createState() => _NewGoalStartViewState();
}

class _NewGoalStartViewState extends State<NewGoalStartView> {
  final newGoal = new Goal(null, null, null, null);
  int selectedRadio;
  Color cardColor;

  void initState() {
    super.initState();
    selectedRadio = 0;
    cardColor = KPrimaryColor;
  }

  setSelectedRadio(int val, Color color) {
    setState(() {
      selectedRadio = val;
      cardColor = color;
      if (selectedRadio == 1) {
        newGoal.isGood = true;
        cardColor = Colors.blue[200];
      } else {
        newGoal.isGood = false;
        cardColor = Colors.red[200];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("New Goal"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: newGoalBehaivorCard(),
                ),
                planetThumbnail,
              ],
            ),
            RoundedButton(
                text: "Continue",
                color: KPrimaryColor,
                press: () {
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

  final planetThumbnail = Container(
    alignment: FractionalOffset.centerRight,
    child: Container(
      height: 300.0,
      width: 225.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          // TODO: New to be specific for every goal.
          image: Svg('assets/Powerful.svg'),
        ),
      ),
    ),
  );

  Container newGoalBehaivorCard() {
    return Container(
      height: 225.0,
      margin: EdgeInsets.only(right: 25.0),
      decoration: BoxDecoration(
        color: cardColor,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Lets Start!!!'),
          ),
          radioButtonName(),
        ],
      ),
    );
  }

  Container radioButtonName() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 100.0),
      child: Center(
        child: Column(
          children: [
            Text("Time to Know, if is a good habit, or something bad??"),
            Radio(
              value: 1,
              groupValue: selectedRadio,
              activeColor: Colors.green,
              onChanged: (val) {
                print("Radio $val");
                setSelectedRadio(val, cardColor);
              },
            ),
            Radio(
              value: 2,
              groupValue: selectedRadio,
              activeColor: Colors.red,
              onChanged: (val) {
                print("Radio $val");
                setSelectedRadio(val, cardColor);
              },
            ),
          ],
        ),
      ),
    );
  }
}
