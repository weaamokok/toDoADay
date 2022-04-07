// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../elements/const.dart';
import '../elements/widgets.dart';
import '../elements/widgets/tasksList.dart';

//TODO refactor the screen
class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime date = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conPrimaryY,
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
          ),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
        backgroundColor: conPrimaryY,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: conToday,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    DateFormat('EEEE').format(date).substring(
                            0, 3) + //date fromat is from intl package
                        ',' +
                        DateFormat('d').format(date) +
                        ' ' +
                        DateFormat('MMMM').format(date),
                    style: conTodaysDate,
                  ),
                  //today's date
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                  //the to dos  container
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                  child: Stack(
                    children: [
                      checkLists(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                            backgroundColor: conPrimaryG,
                            child: Icon(
                              Icons.add_rounded,
                              size: 35,
                            ),
                            onPressed: () {}),
                      )
                    ],
                  ) //here goes the Empty List or the checkList
                  ),
            )
          ],
        ),
      ),
    );
  }
}
