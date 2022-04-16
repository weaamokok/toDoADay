import 'package:flutter/material.dart';

import '../const.dart';
import 'package:intl/intl.dart';

String todo = 'bake a cake';
DateTime date = new DateTime.now();

class aTask extends StatefulWidget {
  @override
  State<aTask> createState() => _aTaskState();
}

class _aTaskState extends State<aTask> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Transform.scale(
        scale: 1.5,
        child: taskCheckBox(isChecked),
      ),
      title: Text(todo,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
              fontFamily: 'Comics',
              fontSize: 15,
              color: Color(0xff2A3642))),
      subtitle: Text(
        DateFormat('jm').format(date), //date format with am,pm
        style: TextStyle(
          fontFamily: 'Comics',
          fontSize: 12,
        ),
      ),
      trailing: Transform.translate(
        offset: Offset(20, 0),
        child: Container(
          decoration: BoxDecoration(
              color: conActPriorityR,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          width: 15,
        ),
      ),
    );
  }
}

class taskCheckBox extends StatelessWidget {
  final bool checkboxState;
  taskCheckBox(this.checkboxState);

  Widget build(BuildContext context) {
    return Checkbox(
        fillColor:
            MaterialStateColor.resolveWith((states) => Color(0xffC4C4C4)),
        value: checkboxState,
        checkColor: conPrimaryB,
        onChanged: (value) {
          // checkboxState= value;
        });
  }
}
