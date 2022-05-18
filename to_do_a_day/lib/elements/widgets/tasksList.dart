import 'package:flutter/material.dart';

import '../module/task.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';

//TODO find way to make the listing in the archive, u'll likely have to create another one to desplay the archive since th achive will list a list of task list;)
class checkLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return aTask(task.name.toString(), task.isDone, task.priority,
                  task.notifacation, (chechboxState) {
                taskData.updateTask(task);
              }, taskData.tasks[index]);
            },
            itemCount: taskData.tasks.length,
          );
        },
      ),
    );
  }
}
