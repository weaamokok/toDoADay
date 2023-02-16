import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/module/task.dart';
import 'package:to_do_a_day/elements/widgets/addingTodo.dart';
import 'package:to_do_a_day/elements/widgets/tasksList.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import '../const.dart';
import 'package:empty_widget/empty_widget.dart';

import 'addingTodoScreen.dart';

class todosContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //the to dos  container

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff).withOpacity(.1),
                  spreadRadius: 28,
                  blurRadius: 10,
                  offset: Offset(14, 27))
            ]),
        child: Stack(
          children: [
            checkLists(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton(
                    backgroundColor: conPrimaryG,
                    child: Icon(
                      Icons.add_rounded,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/addTask');
                      // showModalBottomSheet(
                      //     elevation: 0,
                      //     enableDrag: false,
                      //     isDismissible: false,
                      //     context: context,
                      //     builder: (context) => AddingTaskScreen());

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
              ),
            )
          ],
        ) //here goes the Empty List or the checkList
        );
  }
}
