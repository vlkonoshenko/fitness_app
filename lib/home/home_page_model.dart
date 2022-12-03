import 'package:elementary/elementary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitness_app/models/day_result.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/models/exercise_set.dart';
import 'package:fitness_app/repository.dart';
import 'package:flutter/foundation.dart';

class HomePageModel extends ElementaryModel {
  final ValueNotifier<DayResult> dayResult = ValueNotifier(DayResult(
    date: DateTime.now(),
    exercises: [],
  ));

  final DayRepository repository;

  HomePageModel(this.repository);

  void addExerciseName(String name) {
    dayResult.value.exercises.add(Exercise(sets: [], name: name));
    dayResult.notifyListeners();
  }

  @override
  void init() {
    super.init();

    readData();
  }

  void readData() {
    final ref = FirebaseDatabase.instance.ref();
    final userId = FirebaseAuth.instance.currentUser?.uid;

    ref.child('trainers/$userId').get().then((snapshot) {
      if (snapshot.exists) {
        final a = (snapshot.value as Map).values.map((e) {
          return DayResult.fromJson(Map<String, dynamic>.from(e));
        }).toList();

        dayResult.value = a.first;
        dayResult.notifyListeners();
      } else {
        debugPrint('No data available.');
      }
    });
  }

  void addSet(Exercise object, int parse, int parse2) {
    final index = dayResult.value.exercises.indexOf(object);

    dayResult.value.exercises[index].sets
        .add(ExerciseSet(count: parse, weight: parse2));
    dayResult.notifyListeners();
  }

  void save(String text) {
    repository.saveToFirebase(dayResult.value);
  }
}
