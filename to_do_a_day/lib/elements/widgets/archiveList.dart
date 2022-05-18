import 'package:flutter/material.dart';

import '../module/task.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';

//TODO find way to make the listing in the archive, u'll likely have to create another one to desplay the archive since th achive will list a list of task list;)
class ArchiveLists extends StatefulWidget {
  @override
  State<ArchiveLists> createState() => _ArchiveListsState();
}

class _ArchiveListsState extends State<ArchiveLists> {
  int listLen = TaskData()
      .archivesTasks
      .map((taskList) => taskList)
      .map((tasks) => tasks)
      .toList()
      .length;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
              itemBuilder: (context, index) {
                final task = taskData.archivesTasks
                    .map((taskList) => taskList[index])
                    .map((tasks) => tasks)
                    .toList();

                return aTask(
                    task[index].name.toString(),
                    task[index].isDone,
                    task[index].priority,
                    task[index].notifacation, (chechboxState) {
                  taskData.updateTask(task[index]);
                  //   widget.tasks[index].);//modify this we dont need the checkablitiy
                  // setState(() {toggleDone();
                  // });g
                }, taskData.tasks[index]);
              },
              itemCount: taskData.archivesTasks
                  .map((taskList) => taskList)
                  .toList()
                  .length);
        },
      ),
    );
  }
}
//TODO just find way to add this shit
