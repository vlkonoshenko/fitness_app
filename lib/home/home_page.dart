import 'package:elementary/elementary.dart';
import 'package:fitness_app/home/home_page_wm.dart';
import 'package:fitness_app/repository.dart';
import 'package:flutter/material.dart';

class HomePage extends ElementaryWidget<IHomePageWM> {
  const HomePage({
    Key? key,
    WidgetModelFactory wmFactory = homePageWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IHomePageWM wm) {
    return Scaffold(
      appBar: AppBar(title: Text(wm.date)),
      body: ValueListenableBuilder<DayRepository>(
          valueListenable: wm.list,
          builder: (context, data, _) {
            return ListView(
                children: data.exercises
                    .map((e) => InkWell(
                          onTap: () => wm.onTapExercise(e),
                          child: ListTile(
                            title: Text(e.name),
                            subtitle: SizedBox(
                              height: 40,
                              width: 100,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: e.sets
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Chip(
                                              label: Text(
                                                  '${e.count} X ${e.weight}'),
                                            ),
                                          ))
                                      .toList()),
                            ),
                          ),
                        ))
                    .toList());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: wm.dialogPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
