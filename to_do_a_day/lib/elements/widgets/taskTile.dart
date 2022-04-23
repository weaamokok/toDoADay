import 'package:flutter/material.dart';

import '../const.dart';
import 'package:intl/intl.dart';

String todo = 'bake a cake';
double Spaceing = 0;

class aTask extends StatelessWidget {
  String taskTitle;
  final bool isChecked;
  int priority = 1;
  DateTime? notifi;
  final Function chechboxCallback;

  aTask(this.taskTitle, this.isChecked, this.priority, this.notifi,
      this.chechboxCallback);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: notifi != null ? Spaceing = 0 : Spaceing = 10),
      child: ListTile(
        leading: Transform.scale(
          scale: 1.5,
          child: Checkbox(
              fillColor:
                  MaterialStateColor.resolveWith((states) => Color(0xffC4C4C4)),
              value: isChecked,
              checkColor: conPrimaryB,
              onChanged: (value) {
                chechboxCallback(value);
              }
              //(value) {

              // }
              ),
        ),
        title: Text(taskTitle,
            style: TextStyle(
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

