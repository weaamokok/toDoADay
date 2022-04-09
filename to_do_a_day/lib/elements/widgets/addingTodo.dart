// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
                      autofocus: true,
                    )),
              )
            ],
          ),
        ],
      ),
    ));
