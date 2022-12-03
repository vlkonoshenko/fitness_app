import 'package:elementary/elementary.dart';
import 'package:fitness_app/home/home_page_wm.dart';
import 'package:fitness_app/models/day_result.dart';
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
      appBar: AppBar(
        title: const Text('Тест'),
        actions: [
          IconButton(
            onPressed: () => wm.save(controller.text),
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: ValueListenableBuilder<DayResult>(
          valueListenable: wm.trainer,
          builder: (context, data, _) {
            return ListView(children: [
              Text(data.date.toString()),
              ...data.exercises
                  .map((e) => ListTile(
                        onTap: () => wm.onTapExercise(e),
                        title: Text(e.name),
                        subtitle: SizedBox(
                          height: 50,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: e.sets
                                .map((d) => Container(
                                    color: Colors.amberAccent,
                                    margin: const EdgeInsets.all(2),
                                    child: Text('${d.count} x ${d.weight}')))
                                .toList(),
                          ),
                        ),
                      ))
                  .toList(),
            ]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: wm.dialogPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
