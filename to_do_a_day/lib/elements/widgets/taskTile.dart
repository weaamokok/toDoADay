import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/task_screen.dart';
import '../const.dart';
import 'package:intl/intl.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';

import '../module/task.dart';

String todo = 'bake a cake';
double Spaceing = 0;

class aTask extends StatelessWidget {
  String taskTitle;
  final bool isChecked;
  int priority = 1;
  DateTime? notifi;
  final Function chechboxCallback;
  Task task;
  // TaskData taskData;
//---------------------------
  aTask(this.taskTitle, this.isChecked, this.priority, this.notifi,
      this.chechboxCallback, this.task);
//--------------------------------

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: notifi != null ? Spaceing = 0 : Spaceing = 10),
      child: ListTile(
        onLongPress: () {
          // print('object');
          Provider.of<TaskData>(context, listen: false)
              .deletingTask(task); //archiving
        },
        leading: Transform.scale(
          scale: 1.5,
          child: Checkbox(
              side: BorderSide(color: conPrimaryB.withOpacity(.4)),
              activeColor: conPrimaryB,
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              value: isChecked,
              checkColor: yellow,
              onChanged: (value) {
                chechboxCallback(value);
              }
              //(value) {

              // }
              ),
        ),
        title: Text(taskTitle,
            style: TextStyle(
                decorationColor: yellow,
                decorationStyle: TextDecorationStyle.wavy,
                decorationThickness: 1.5,
                decoration: isChecked ? TextDecoration.lineThrough : null,
                fontFamily: 'Comics',
                fontSize: 15,
                color: Color(0xff2A3642))),
        subtitle: notifi != null
            ? Text(
                DateFormat('jm').format(notifi!), //date format with am,pm
                style: TextStyle(
                  fontFamily: 'Comics',
                  fontSize: 12,
                ),
              )
            : null,
        trailing: Transform.translate(
          offset: Offset(20, 0),
          child: Container(
            decoration: BoxDecoration(
                color: priorityColor(priority),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )),
            width: 15,
          ),
        ),
      ),
    );
  }
}
// (bool checkState) {
//     setState(() {
//       isChecked = checkState;
//     }
