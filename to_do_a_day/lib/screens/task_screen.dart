import 'dart:io';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu_rounded,
          color: Colors.white,
          size: 30,
        ),
        actions: [
          Icon(
            Icons.help_rounded,
            color: Colors.white,
            size: 30,
          )
        ],
        elevation: 0,
        backgroundColor: Color(0xffF3C623),
      ),
      body: Container(),
    );
  }
}
