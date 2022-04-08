import 'package:flutter/material.dart';

import '../const.dart';

class aTask extends StatefulWidget {
  @override
  State<aTask> createState() => _aTaskState();
}

class _aTaskState extends State<aTask> {
  bool c = false;

  String todo = 'bake a cake';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
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
      trailing: Container(
        width: 30,
        color: Color(0xffD25656),
      ),
    );
  }
}
