// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/widgets.dart';
// ignore: unnecessary_import

import '../const.dart';

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
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'priority',
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'Comics', color: conPrimaryB),
                ),
              ),
              priorityBox(conPriorityR, 20),
              priorityBox(conPriorityY, 60),
              priorityBox(conPriorityG, 100)
            ],
          ),
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
