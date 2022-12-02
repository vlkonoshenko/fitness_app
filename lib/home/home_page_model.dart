import 'package:elementary/elementary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/models/exercise_set.dart';
import 'package:fitness_app/repository.dart';
import 'package:flutter/foundation.dart';

import '../models/custom_user.dart';

class HomePageModel extends ElementaryModel {
  final ValueNotifier<DayRepository> repository;
  HomePageModel(this.repository);
  final trainer = ValueNotifier(<CustomUser>[]);
  void addExerciseName(String name) {
    repository.value.addExercise(Exercise(sets: [], name: name));
    repository.notifyListeners();
  }

  @override
  void init() {
    super.init();

    readData();
  }

  void readData() {
    final ref = FirebaseDatabase.instance.ref();
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final snapshot = ref.child('trainers/$userId').get().then((snapshot) {
      if (snapshot.exists) {
        final a = (snapshot.value as Map).values.map((e) {
          return CustomUser.fromJson(Map<String, dynamic>.from(e));
        }).toList();

        trainer.value = a;
      } else {
        print('No data available.');
      }
    });
  }

  void addSet(Exercise excersiseId, int parse, int parse2) {
    repository.value.addSet(
      excersiseId,
      ExerciseSet(count: parse, weight: parse2),
    );
    repository.notifyListeners();
  }

  void save(String text) {
    repository.value.saveToFirebase(text);
  }
}
