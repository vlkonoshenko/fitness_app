import 'package:elementary/elementary.dart';
import 'package:fitness_app/home/home_page_wm.dart';
import 'package:fitness_app/models/custom_user.dart';
import 'package:flutter/material.dart';

class HomePage extends ElementaryWidget<HomePageWM> {
  final TextEditingController controller = TextEditingController();

  HomePage({
    Key? key,
    WidgetModelFactory wmFactory = homePageWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(HomePageWM wm) {
    return Scaffold(
      appBar: AppBar(title: Text(wm.date)),
      body: ValueListenableBuilder<List<CustomUser>>(
          valueListenable: wm.trainer,
          builder: (context, data, _) {
            return ListView(children: [
              TextField(controller: controller),
              ...data
                  .map((e) => ListTile(
                        title: Text(e.date.toString()),
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
