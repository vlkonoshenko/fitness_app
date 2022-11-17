import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Exercise> list = [];

  final storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('Logout'))
      ]),
      body: ListView(
        children: list
            .map((e) => ListTile(
                  title: Text(e.name),
                  subtitle: Text('${e.count} на ${e.weight}'),
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialogBuilder(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final name = TextEditingController();
        final count = TextEditingController();
        final weight = TextEditingController();

        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(label: Text('Название')),
              ),
              TextField(
                controller: count,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration:
                    const InputDecoration(label: Text('Количество повторений')),
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
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                setState(() {
                  list.add(Exercise(
                      name.text, int.parse(count.text), int.parse(count.text)));
                });
                storage.ref()
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Exercise {
  final String name;
  final int count;
  final int weight;

  Exercise(this.name, this.count, this.weight);
}
