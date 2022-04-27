import 'package:flutter/material.dart';

import '../module/task.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';

class checkLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return aTask(
                  taskData.tasks[index].name.toString(),
                  taskData.tasks[index].isDone,
                  taskData.tasks[index].priority,
                  taskData.tasks[index].notifacation, (chechboxState) {
                // setState(() {
                //   widget.tasks[index].toggleDone();
                // });
              });
            },
            itemCount: taskData.tasks.length,
          );
        },
      ),
    );
  }
}
