import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/module/task.dart';
import 'package:to_do_a_day/elements/widgets/addingTodo.dart';
import 'package:to_do_a_day/elements/widgets/tasksList.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import '../const.dart';
import 'package:empty_widget/empty_widget.dart';

class todosContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //the to dos  container

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: Stack(
          children: [
            Provider.of<TaskData>(context, listen: true).isEmptyList()
                ? checkLists()
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
                  ),
            Transform.translate(
              offset: Offset(340, 550),
              child: FloatingActionButton(
                  backgroundColor: conPrimaryG,
                  child: Icon(
                    Icons.add_rounded,
                    size: 35,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        enableDrag: false,
                        isDismissible: false,
                        context: context,
                        builder: (context) => AddTaskScreen());
                    // setState(() {
                    //   tasks.add(Task(
                    //       name: newTask,
                    //       priority: selectedPriority == null
                    //           ? 1
                    //           : selectedPriority,
                    //       notifacation: alarm));
                    // });
                    //  }));
                  }),
            )
          ],
        ) //here goes the Empty List or the checkList
        );
  }
}
