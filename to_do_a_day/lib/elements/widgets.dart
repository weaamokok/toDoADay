// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/signing.dart';
import 'const.dart';
import 'package:path/path.dart';

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

  priorityBox(@required Color this.boxColor, this.margining);

  @override
  State<priorityBox> createState() => _priorityBoxState();
}

class _priorityBoxState extends State<priorityBox> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
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
    );
  }
}

//the text feilds for sign in and sign up
Widget txtFeild(
  context,
  String label,
  TextEditingController controller2,
  int type,
) {
  return Container(
    width: 274,
    height: 45,
    child: TextFormField(
      controller: controller2,
      obscureText: type == 3 ? true : false,
      style: conTodoTextStyle.copyWith(color: conPrimaryB, fontSize: 12),
      decoration: fieldDecor.copyWith(hintText: label),
      keyboardType: type == 1 ? TextInputType.emailAddress : TextInputType.text,
      onChanged: (value) {
        type == 1
            ? Provider.of<siggning>(context, listen: false).setEmail(value)
            : type == 2
                ? Provider.of<siggning>(context, listen: false)
                    .setUsername(value)
                : Provider.of<siggning>(context, listen: false)
                    .setpasswprd(value);
      },
    ),
  );
}

//standerd button
class RoundedButton extends StatelessWidget {
  final Color bcolor;
  final Widget child;
  final Function ontap;
  RoundedButton(this.bcolor, this.child, this.ontap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(),
      child: Container(
          child: Center(child: child),
          width: 274,
          height: 45,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: bcolor,
              border: bcolor == yellow
                  ? null
                  : Border.all(
                      color: Color(0xffDFE1E3).withOpacity(.7), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(50)))),
    );
  }
}

//buttons for third party log
Widget RoundedButtonForGoogleAndFacebookSign(
    String text, Icon icon, Function ontap) {
  return RoundedButton(
      Colors.white,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: conTodoTextStyle.copyWith(
                fontSize: 14, color: conPrimaryB.withOpacity(.6)),
          )
        ],
      ),
      ontap);
}

Widget menuNavs(IconData icon, String text, Function callback,
    String currentPath, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 60.0, top: 30),
    child: InkWell(
        onTap: () => callback(),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LineIcon(
              icon,
              size: 35,
              color: ModalRoute.of(context)!.settings.name == currentPath
                  ? Colors.white
                  : Colors.white.withOpacity(.5),
            ),
            SizedBox(width: 30),
            Text(
              text,
              style: conToday.copyWith(
                  fontSize: 16,
                  color: ModalRoute.of(context)!.settings.name == currentPath
                      ? Colors.white
                      : Colors.white.withOpacity(.5)),
            )
          ],
        )),
  );
}

Widget iconText(IconData icon, String text, Function callback) {
  return Padding(
    padding: EdgeInsets.only(left: 10),
    child: InkWell(
        onTap: () => callback(),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LineIcon(icon, size: 35, color: Colors.white),
            SizedBox(width: 10),
            Text(
              text,
              style: conToday.copyWith(fontSize: 13, color: Colors.white),
            )
          ],
        )),
  );
}

Widget EditButton(Function ontap) {
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Row(
      children: [
        Text(
          'edit',
          style: conTodaysDate.copyWith(
              color: Colors.white.withOpacity(.6),
              decoration: TextDecoration.underline),
        ),
        Icon(
          Icons.mode_edit_outline,
          color: Colors.white.withOpacity(.6),
        ),
      ],
    ),
  );
}
