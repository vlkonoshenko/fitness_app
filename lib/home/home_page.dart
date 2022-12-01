import 'package:elementary/elementary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitness_app/home/home_page_wm.dart';
import 'package:fitness_app/models/custom_user.dart';
import 'package:flutter/material.dart';

class HomePage extends ElementaryWidget<IHomePageWM> {
  final TextEditingController controller = TextEditingController();
  final trainer = ValueNotifier(<CustomUser>[]);
  HomePage({
    Key? key,
    WidgetModelFactory wmFactory = homePageWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IHomePageWM wm) {
    final ref = FirebaseDatabase.instance.ref();
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final snapshot = ref.child('trainers/$userId').get().then((snapshot) {
      if (snapshot.exists) {
        trainer.value = ((snapshot.value as List)
            .map((e) => CustomUser.fromJson(e))
            .toList());
        trainer.notifyListeners();
      } else {
        print('No data available.');
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(wm.date)),
      body: ValueListenableBuilder<List<CustomUser>>(
          valueListenable: trainer,
          builder: (context, data, _) {
            return ListView(children: [
              TextField(controller: controller),
              ...data
                  .map((e) => ListTile(
                        title: Text(e.date.toString()),
                        subtitle: Text(e.exercise.first.name),
                      ))
                  .toList()
            ]);
          }),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: wm.dialogPressed,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => wm.save(controller.text),
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
