import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/models/exercise_set.dart';

import 'models/day_result.dart';

abstract class IDayRepository {
  void addExercise(Exercise exercise);
  void remove(int id);
  void addSet(Exercise e, ExerciseSet exerciseSet);
}

class DayRepository implements IDayRepository {
  final DayResult dayResults = DayResult(date: DateTime.now(), exercises: []);

  DayRepository();

  @override
  void addExercise(Exercise exercise) {
    dayResults.exercises.add(exercise);
  }

  @override
  void addSet(Exercise exerciseId, ExerciseSet exerciseSet) {
    dayResults.exercises
        .where((element) => element == exerciseId)
        .first
        .sets
        .add(exerciseSet);
  }

  @override
  void remove(int id) {
    dayResults.exercises.removeAt(id);
  }

  void saveToFirebase(DayResult result) {
    final database = FirebaseDatabase.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final messagesRef = database.ref('trainers/$uid');

    final b = result.toJson();
    messagesRef.push().update(b);
  }
}
