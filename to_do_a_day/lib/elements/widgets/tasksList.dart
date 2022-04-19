import 'package:flutter/material.dart';

import '../module/task.dart';
import 'taskTile.dart';

class checkLists extends StatefulWidget {
  final List<Task> tasks;
  checkLists(this.tasks);
  @override
  State<checkLists> createState() => _checkListsState();
}

class _checkListsState extends State<checkLists> {
  //the list that would handle
  bool? c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return aTask(
              widget.tasks[index].name.toString(),
              widget.tasks[index].isDone,
              widget.tasks[index].priority,
              widget.tasks[index].notifacation, (chechboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          });
        },
        itemCount: widget.tasks.length,
      ),
    );
  }
}
