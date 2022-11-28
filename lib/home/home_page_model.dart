import 'package:elementary/elementary.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/models/exercise_set.dart';
import 'package:fitness_app/repository.dart';
import 'package:flutter/foundation.dart';

class HomePageModel extends ElementaryModel {
  final ValueNotifier<DayRepository> repository;
  HomePageModel(this.repository);

  void addExerciseName(String name) {
    repository.value.addExercise(Exercise(sets: [], name: name));
    repository.notifyListeners();
  }

  void addSet(Exercise excersiseId, int parse, int parse2) {
    repository.value.addSet(
      excersiseId,
      ExerciseSet(count: parse, weight: parse2),
    );
    repository.notifyListeners();
  }

  void save() {
    repository.value.saveToFirebase();
  }
}
