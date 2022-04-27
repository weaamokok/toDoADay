import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/module/task.dart';
import 'package:to_do_a_day/elements/widgets/addingTodo.dart';
import 'package:to_do_a_day/elements/widgets/tasksList.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import '../const.dart';

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
            checkLists(),
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
