import 'package:elementary/elementary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/home/home_page_model.dart';
import 'package:fitness_app/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/exercise.dart';
import 'home_page.dart';

HomePageWM homePageWMFactory(BuildContext context) {
  return HomePageWM(HomePageModel(ValueNotifier(DayRepository())));
}

class HomePageWM extends WidgetModel<HomePage, HomePageModel>
    implements IHomePageWM {
  final _list = <Exercise>[];
  HomePageWM(super.model);

  @override
  void onSignOutPressed() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  void dialogPressed() {
    _dialogBuilder(context);
  }

  @override
  ValueListenable<DayRepository> get list => model.repository;

  @override
  String get date => '';

  @override
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

abstract class IHomePageWM extends IWidgetModel {
  ValueListenable<DayRepository> get list;

  String get date;

  void onSignOutPressed();

  void dialogPressed();

  void onTapExercise(Exercise e);

  void save(String text);
}
