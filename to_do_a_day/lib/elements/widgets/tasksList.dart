import 'package:flutter/material.dart';

import '../../screens/task_screen.dart';
import '../const.dart';
import '../module/task.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import 'package:to_do_a_day/elements/module/databaseHelper.dart';

//TODO find way to make the listing in the archive, u'll likely have to create another one to desplay the archive since th achive will list a list of task list;)
class checkLists extends StatelessWidget {
  final db = DatabaseHandler();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return FutureBuilder(
              future: db.getTasks(),
              builder: (context, AsyncSnapshot<List<Task>> snapshot) {
                taskData.len = snapshot.data?.length;

                if (taskData.len != 0 && snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final task = snapshot.data![index];
                      return aTask(
                          task.name.toString(),
                          task.isDone,
                          task.priority,
                          DateTime.tryParse(task.notifacation ??
                              ''), //the method parse didnt work tryParse() is it for the job here
                          (chechboxState) {
                        taskData.updateTask(task);
                      }, task);
                    },
                    itemCount: snapshot.data?.length,
                  );
                } else {
                  return Center(
                    child: Column(children: [
                      SizedBox(
                        height: 80,
                      ),
                      Image.asset(
                        'images/Stuck at Home - To Do List.png',
                        width: 209,
                        height: 209,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'add your to-dos for today,\n remember yours to-dos will be \n archived when the day is over',
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
