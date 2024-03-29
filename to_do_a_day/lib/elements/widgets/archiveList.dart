import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const.dart';
import '../module/databaseHelper.dart';
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
  @override
  Widget build(BuildContext context) {
    final db = DatabaseHandler();
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return FutureBuilder(
              future: db.getArchivedTasks(),
              builder: (context, AsyncSnapshot<List<Task>> snapshot) {
                taskData.archlen = snapshot.data?.length;
                if (taskData.archlen != 0 && snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final task = snapshot.data![index];
                      DateTime? creation = DateTime.tryParse(task.creationTime);
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              DateFormat('d').format(creation as DateTime) +
                                  ' ' +
                                  DateFormat('MMM')
                                      .format(creation as DateTime),
                              style: conTodaysDate.copyWith(
                                  color: Colors.black54, fontSize: 10),
                            ),
                          ),
                          Expanded(
                              flex: 20,
                              child: aTask(
                                taskTitle: task.name.toString(),
                                isChecked: task.isDone,
                                priority: task.priority,
                                notifi: DateTime.tryParse(task.notifacation ??
                                    ''), //the method parse didnt work tryParse() is it for the job here
                                chechboxCallback: (chechboxState) {
                                  // taskData.updateTask(task);
                                },
                                task: task,
                                dayOfCreation: task.creationTime,
                              ))
                        ],
                      );
                    },
                    itemCount: snapshot.data?.length,
                  );
                } else {
                  return Center(
                    child: Column(children: [
                      SizedBox(
                        height: 200,
                      ),
                      Image.asset(
                        'images/Wavy Buddies - Box.png',
                        width: 210,
                        height: 210,
                      ),
                      Text(
                        'add your to-dos will be \nautomatically moved here\n at the end of each day',
                        textAlign: TextAlign.center,
                        style: conTodoTextStyle.copyWith(
                            color: Color(0xff2A3642).withOpacity(0.5)),
                      )
                    ]),
                  );
                }
              });
        },
      ),
    );
  }
}
//TODO just find way to add this shit
