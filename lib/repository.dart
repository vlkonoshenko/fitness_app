import 'package:collection/collection.dart';
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
  final List<DayResult> dayResults = [DayResult(DateTime.now(), [])];

  DayRepository();

  List<Exercise> get exercises =>
      dayResults
          .firstWhereOrNull((element) => element.date.day == DateTime.now().day)
          ?.exercises ??
      [];

  @override
  void addExercise(Exercise exercise) {
    final database = FirebaseDatabase.instance;
    final messagesRef = database.ref('trainers');
    messagesRef.push().set({'a': 'ads'});

    exercises.add(exercise);
  }

  @override
  void addSet(Exercise exerciseId, ExerciseSet exerciseSet) {
    exercises
        .where((element) => element == exerciseId)
        .first
        .sets
        .add(exerciseSet);
  }

  @override
  void remove(int id) {
    exercises.removeAt(id);
  }
}
