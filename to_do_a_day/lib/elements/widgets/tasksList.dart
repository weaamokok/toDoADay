import 'package:flutter/material.dart';

import '../module/task.dart';
import 'taskTile.dart';

class checkLists extends StatefulWidget {
  @override
  State<checkLists> createState() => _checkListsState();
}

class _checkListsState extends State<checkLists> {
  //the list that would handle
  bool? c;

  List<Task> tasks = [
    Task(name: 'buy milk', notifacation: null, priority: 3),
    Task(
      name: 'buy ki',
      notifacation: DateTime.now(),
      priority: 3,
    ),
    Task(name: 'buy lk', notifacation: null, priority: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return aTask(
              tasks[index].name.toString(),
              tasks[index].isDone,
              tasks[index].priority,
              tasks[index].notifacation, (chechboxState) {
            setState(() {
              tasks[index].toggleDone();
            });
          });
        },
        itemCount: tasks.length,
      ),
    );
  }
}
