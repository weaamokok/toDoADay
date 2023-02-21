import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

Color conPrimaryY = Color(0xffF3C623);
Color conPrimaryB = Color(0xff2A3642);
Color conPrimaryG = Color(0xff127681);
Color yellow = Color(0xffE9C02D);
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
Color hints = Color(0xff2A3642).withOpacity(.4);
Color facebookColor = Color(0xff039BE5);
Color googleColor = Color(0xffE53935);

//--------------------
DateTime CurrentDate = new DateTime.now();
//-----------------------------
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
TextStyle connotifacationTimeTextStyle =
    TextStyle(fontFamily: 'Comics', fontSize: 15, color: Color(0xff2A3642));
TextStyle conCheckedTodoTextStyle = TextStyle(
    decoration: TextDecoration.combine([
      TextDecoration.lineThrough,
    ]),
    fontFamily: 'Comics',
    fontSize: 15,
    decorationColor: yellow);
Text displayedDate = Text(
  DateFormat('EEEE')
          .format(CurrentDate)
          .substring(0, 3) + //date fromat is from intl package
      ',' +
      DateFormat('d').format(CurrentDate) +
      ' ' +
      DateFormat('MMMM').format(CurrentDate),
  style: conTodaysDate,
);
//-----------------------------------
OutlineInputBorder border = OutlineInputBorder(
    gapPadding: 5,
    borderSide: BorderSide(
      color: Color(0xffC4C8CC).withOpacity(.3),
      width: 1.5,
    ),
    // ignore: prefer_const_constructors
    borderRadius: BorderRadius.all(Radius.circular(20)));
//--------------------------------
InputDecoration fieldDecor = InputDecoration(
    enabledBorder: border,
    contentPadding: EdgeInsets.only(left: 30),
    alignLabelWithHint: true,
    fillColor: Color(0xffCFD6DC).withOpacity(.1),
    focusedBorder: border,
    hintStyle: conTodaysDate.copyWith(color: hints));
//-------------icons
Icon google = (LineIcon.googleLogo(
  size: 30,
  color: googleColor,
));
Icon facebook = (LineIcon.facebook(
  size: 30,
  color: facebookColor,
));

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

final timePickerTheme = TimePickerThemeData(
    hourMinuteColor: Colors.black54,
    backgroundColor: Colors.white,
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    dayPeriodColor: yellow,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    dayPeriodTextColor: Colors.white,
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.orange, width: 4),
    ),
    hourMinuteTextStyle:
        const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    dayPeriodTextStyle:
        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    helpTextStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    hourMinuteTextColor: Colors.black54,
    entryModeIconColor: Colors.orange,
    dialTextColor: yellow);
