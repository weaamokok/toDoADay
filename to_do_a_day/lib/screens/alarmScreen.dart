import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';

import '../elements/const.dart';

class alarmScreen extends StatefulWidget {
  @override
  State<alarmScreen> createState() => _alarmScreenState();
}

class _alarmScreenState extends State<alarmScreen> {
  DateTime? time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //prevents the keyboarsd from overflowing
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 18),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: conPrimaryB.withOpacity(.8),
              size: 50,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "pick a time",
              style: conTodoTextStyle,
            ),
            Text(
              "to remained you to add your todos",
              style: conTodoTextStyle.copyWith(fontSize: 13),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 0)),
                      BoxShadow(
                          color: Colors.black12.withOpacity(.1),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: Offset(0, 0)),
                      BoxShadow(
                          color: Colors.black12.withOpacity(.1),
                          blurRadius: 20,
                          offset: Offset(-5, 0)),
                      BoxShadow(
                          color: Colors.black12.withOpacity(.1),
                          blurRadius: 5,
                          offset: Offset(0, 0)),
                    ],
                    color: gPriority.withOpacity(.9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: TimePickerSpinner(
                  time: Provider.of<TaskData>(context, listen: false)
                      .morningAlert,
                  highlightedTextStyle:
                      TextStyle(color: Colors.white, fontSize: 25),
                  normalTextStyle:
                      TextStyle(color: Colors.white54, fontSize: 20),
                  spacing: 10,
                  is24HourMode: false,
                  itemHeight: 30,
                  onTimeChange: (p0) {
                    setState(() {
                      time = p0;
                    });
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                    backgroundColor: conPrimaryY,
                    child: Icon(
                      Icons.check,
                      size: 35,
                    ),
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .morningAlert = time as DateTime;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                          'alarm is all set',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Cairo', fontSize: 13),
                        )),
                      );
                      Navigator.pop(context);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
