// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';

import 'const.dart';

Widget EmptyList = Column(
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
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Image(
                image: AssetImage('images/Stuck at Home - To Do List.png'),
              ),
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
                color: conPrimaryB.withOpacity(.2)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    SizedBox(
      height: 120,
      // height: MediaQuery.of(context).size.height * .158,
    ),
  ],
);
