import 'package:flutter/material.dart';

import 'taskTile.dart';

class checkLists extends StatelessWidget {
  //the list that would handle
  bool? c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: ListView(children: <Widget>[aTask()]),
    );
  }
}
