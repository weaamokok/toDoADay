import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_a_day/elements/module/database.dart';
import '../../screens/task_screen.dart';
import '../const.dart';
import '../module/task.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';

//TODO find way to make the listing in the archive, u'll likely have to create another one to desplay the archive since th achive will list a list of task list;)
class checkLists extends StatelessWidget {
  var db = TodoProvider();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return FutureBuilder<List<Task>>(
              future: db.getTodo(),
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return Text('loading');
                // }

                return snapshot.data!.length != 0
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          final task = Tasks[index];
                          return aTask(
                              task.name.toString(),
                              task.isDone,
                              task.priority,
                              task.notifacation, (chechboxState) {
                            taskData.updateTask(task);
                          }, Tasks[index]);
                        },
                        itemCount: snapshot.data!.length)
                    : Center(
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
              });
        },
      ),
    );
  }
}
