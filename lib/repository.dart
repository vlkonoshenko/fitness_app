import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/models/exercise_set.dart';

import 'models/day_result.dart';

abstract class IDayRepository {
  void addExercise(Exercise exercise);
  void remove(int id);
  void addSet(Exercise e, ExerciseSet exerciseSet);
}

class DayRepository implements IDayRepository {
  final DayResult dayResult = DayResult(DateTime.now(), []);

  DayRepository();

  List<Exercise> get exercises => dayResult.exercises;

  @override
  void addExercise(Exercise exercise) {
    dayResult.exercises.add(exercise);
  }

  @override
  void addSet(Exercise exerciseId, ExerciseSet exerciseSet) {
    dayResult.exercises
        .where((element) => element == exerciseId)
        .first
        .sets
        .add(exerciseSet);
  }

  @override
  void remove(int id) {
    dayResult.exercises.removeAt(id);
  }
}
