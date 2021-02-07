import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:reachYourGoals/models/goal.dart';

class FirestoreService {
  CollectionReference _db = FirebaseFirestore.instance.collection('goals');

  // Create a new Goal in database
  Future<void> addGoal(Goal goal) {
    return _db.add({
      'goalName': goal.goalName,
      'startDate': goal.startDate,
      'endDate': goal.endDate,
      'isGood': goal.isGood,
    });
  }
}
