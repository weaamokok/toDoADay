// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/widgets.dart';
// ignore: unnecessary_import

import '../const.dart';

Color gPriority = conActPriorityG;
Color yPriority = conActPriorityY;
Color rPriority = conActPriorityR;
void selectionColor(int priority) {
  //1is green 2 is yellow 3 is red

  if (priority == 1) {
    //if green
    if (gPriority == conActPriorityG) {
      print(gPriority);

      gPriority = conInActPriorityG;
      yPriority = conActPriorityY;
      rPriority = conActPriorityR;
    } else {
      gPriority = conActPriorityG;
    }
  }
  if (priority == 2) {
    //if yellow
    if (yPriority == conActPriorityY) {
      yPriority = conInActPriorityY;
      gPriority = conActPriorityG;
      rPriority = conActPriorityR;
    } else {
      yPriority = conActPriorityY;
    }
  }
  if (priority == 3) {
    print('fuck');
    //if red
    if (rPriority == conActPriorityR) {
      rPriority = conInActPriorityR;
      yPriority = conActPriorityY;
      gPriority = conActPriorityG;
    } else {
      rPriority = conActPriorityR;
    }
  }
}

Widget buildBottomSheet(BuildContext context) => Container(
    color: Color(0xff757575),
    child: Container(
      padding: EdgeInsets.only(top: 7, left: 17, right: 17),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Done',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Comics',
                      color: Color(0xff58A14C)),
                ),
              )),
          Stack(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xffC4C4C4)),
                    value: false,
                    checkColor: conPrimaryB,
                    onChanged: (value) {}),
              ),
              Transform.translate(
                offset: Offset(50, 0),
                // ignore: prefer_const_constructors
                child: SizedBox(
                    width: 300,
                    // ignore: prefer_const_constructors
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: conPrimaryG.withOpacity(.6))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: conPrimaryG.withOpacity(.2)))),
                      autofocus: true,
                    )),
              )
            ],
          ),
          SizedBox(
            height: 35,
          ),
          priority(),
          Divider(
            indent: 50,
            endIndent: 40,
            height: 80,
            thickness: 1,
            color: Color(0xff8B929D).withOpacity(.2),
          )
        ],
      ),
    ));

class priority extends StatefulWidget {
  @override
  State<priority> createState() => _priorityState();
}

class _priorityState extends State<priority> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            'priority',
            style: TextStyle(
                fontSize: 16, fontFamily: 'Comics', color: conPrimaryB),
          ),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                selectionColor(3);
              });
            },
            child: priorityBox(rPriority, 20)),
        GestureDetector(
            onTap: () {
              setState(() {
                selectionColor(2);
              });
            },
            child: priorityBox(yPriority, 60)),
        GestureDetector(
            onTap: () {
              setState(() {
                selectionColor(1);
              });
            },
            child: priorityBox(gPriority, 100))
      ],
    );
  }
}
