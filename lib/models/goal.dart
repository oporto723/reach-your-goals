class Goal {
  String goalName;
  DateTime startDate;
  DateTime endDate;
  bool isGood;

  Goal(this.goalName, this.startDate, this.endDate, this.isGood);

  Map<String, dynamic> toJSON() => {
        'goalName': goalName,
        'startDate': startDate,
        'endDate': endDate,
        'isGood': isGood,
      };
}
