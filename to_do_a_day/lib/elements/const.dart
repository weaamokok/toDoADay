import 'package:flutter/material.dart';

Color conPrimaryY = Color(0xffF3C623);
Color conPrimaryB = Color(0xff2A3642);
Color conPrimaryG = Color(0xff127681);
//priority colors
Color conActPriorityR = Color(0xffD25656);
Color conInActPriorityR = Color(0xffD25656).withOpacity(.3);
Color conActPriorityY = Color(0xffCFC146);
Color conInActPriorityY = Color(0xffCFC146).withOpacity(.3);
Color conActPriorityG = Color(0xff58A14C);
Color conInActPriorityG = Color(0xff58A14C).withOpacity(.3);
Color gPriority = conActPriorityG;
Color yPriority = conActPriorityY;
Color rPriority = conActPriorityR;
TextStyle conToday = TextStyle(
    color: Colors.white,
    fontFamily: 'ComicsB',
    fontSize: 31,
    fontWeight: FontWeight.w600);
TextStyle conTodaysDate = TextStyle(
    color: Colors.white,
    fontFamily: 'Comics',
    fontSize: 13,
    fontWeight: FontWeight.normal);
TextStyle conTodoTextStyle =
    TextStyle(fontFamily: 'Comics', fontSize: 15, color: Color(0xff2A3642));
TextStyle conCheckedTodoTextStyle = TextStyle(
    decoration: TextDecoration.lineThrough,
    fontFamily: 'Comics',
    fontSize: 15,
    color: Color(0xff2A3642));
Color priorityColor(int priority) {
  if (priority == 1) {
    //if green
    return conActPriorityG;
  } else if (priority == 2) {
    //if yellow
    return conActPriorityY;
  } else if (priority == 3) {
    return conActPriorityR;
  } else
    return conActPriorityG;
}
