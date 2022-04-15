import 'package:flutter/material.dart';

import '../const.dart';
import 'package:intl/intl.dart';

class aTask extends StatefulWidget {
  @override
  State<aTask> createState() => _aTaskState();
}

class _aTaskState extends State<aTask> {
  bool c = false;

  String todo = 'bake a cake';
  DateTime date = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Transform.scale(
        scale: 1.5,
        child: Checkbox(
            fillColor:
                MaterialStateColor.resolveWith((states) => Color(0xffC4C4C4)),
            value: c,
            checkColor: conPrimaryB,
            onChanged: (value) {
              setState(() {
                c = value!;
              });
            }),
      ),
      title: Text(
        todo,
        style: c
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                fontFamily: 'Comics',
                fontSize: 15,
                color: Color(0xff2A3642))
            : TextStyle(
                fontFamily: 'Comics', fontSize: 15, color: Color(0xff2A3642)),
      ),
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
