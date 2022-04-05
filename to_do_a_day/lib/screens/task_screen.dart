// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../elements/const.dart';

//TODO refactor the screen
class TasksScreen extends StatelessWidget {
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
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          ///if it's the first time to enter the app or its 12 am set this otherwise
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 209,
                            height: 209,
                            child: Image(
                              image: AssetImage(
                                  'images/Stuck at Home - To Do List.png'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'add your to-dos for today,\n remember your to-dos will be archived when the day is over',
                            style: TextStyle(
                                fontFamily: 'Comics',
                                fontSize: 16,
                                color: Color(0xff2A3642).withOpacity(.2)),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      // height: MediaQuery.of(context).size.height * .158,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                          backgroundColor: Color(0xff127681),
                          child: Icon(
                            Icons.add_rounded,
                            size: 35,
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
