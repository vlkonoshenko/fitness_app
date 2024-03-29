import 'package:elementary/elementary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/home/home_page_model.dart';
import 'package:fitness_app/models/day_result.dart';
import 'package:fitness_app/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/exercise.dart';
import 'home_page.dart';

HomePageWM homePageWMFactory(BuildContext context) {
  return HomePageWM(HomePageModel(DayRepository()));
}

class HomePageWM extends WidgetModel<HomePage, HomePageModel> {
  HomePageWM(super.model);

  void onSignOutPressed() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void dialogPressed() {
    _dialogBuilder(context);
  }

  ValueNotifier<DayResult> get trainer => model.dayResult;

  void onTapExercise(Exercise e) {
    _dialogAddSetBuilder(e, context);
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final name = TextEditingController();

        return AlertDialog(
          title: const Text('Новое упражнени'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(label: Text('Название')),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Добавить'),
              onPressed: () {
                model.addExerciseName(name.text);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogAddSetBuilder(Exercise id, BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final count = TextEditingController();
        final weight = TextEditingController();

        return AlertDialog(
          title: const Text('Подход'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: count,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(label: Text('Количество')),
              ),
              TextField(
                controller: weight,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(label: Text('Вес')),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Добавить'),
              onPressed: () {
                model.addSet(id, int.parse(count.text), int.parse(weight.text));

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void save(String text) {
    model.save(text);
  }
}
