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

//here priority Box widget that goes in the bottom sheet//need to set Gesture
class priorityBox extends StatefulWidget {
  Color boxColor;
  final double margining;
  int priority;
  priorityBox(@required Color this.boxColor, this.margining, this.priority);

  @override
  State<priorityBox> createState() => _priorityBoxState();
}

class _priorityBoxState extends State<priorityBox> {
  bool selected = false;
  void selectionColor(int priority) {
    //1is green 2 is yellow 3 is red

    if (priority == 1) {
      //if green
      if (widget.boxColor == conActPriorityG) {
        print(widget.boxColor);

        widget.boxColor = conInActPriorityG;
      } else {
        widget.boxColor = conActPriorityG;
        print('fuck');
      }
    }
    if (priority == 2) {
      print(widget.boxColor);
      //if yellow
      if (widget.boxColor == conActPriorityY) {
        widget.boxColor = conInActPriorityY;
      } else {
        widget.boxColor = conActPriorityY;
      }
    }
    if (priority == 3) {
      print('fuck');
      //if red
      if (widget.boxColor == conActPriorityR) {
        widget.boxColor = conInActPriorityR;
      } else {
        widget.boxColor = conActPriorityR;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => {
          setState(() {
            selectionColor(widget.priority);
          })
        },
        child: Container(
            margin: EdgeInsets.only(right: widget.margining),
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: widget.boxColor, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Container(
                margin: EdgeInsets.all(2),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: widget.boxColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff).withOpacity(.1),
                          spreadRadius: 1,
                          blurRadius: 14,
                          offset: Offset(1, 1))
                    ]))),
      ),
    );
  }
}
