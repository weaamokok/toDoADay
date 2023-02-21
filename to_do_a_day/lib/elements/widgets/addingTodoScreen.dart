// ignore_for_file: prefer_const_constructors
import 'package:alarm/alarm.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/widgets.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
// ignore: unnecessary_import
import 'package:alarm/alarm.dart';
import '../const.dart';

String? newTask;
int selectedPriority = 1;
DateTime? alarm;
DateTime? creationTime;

void selectionColor(int priority) {
  //1is green 2 is yellow 3 is red

  if (priority == 1) {
    //if green
    if (gPriority == conActPriorityG) {
      print(gPriority);

      gPriority = conInActPriorityG;
      yPriority = conActPriorityY;
      rPriority = conActPriorityR;
      selectedPriority = 1;
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
      selectedPriority = 2;
    } else {
      yPriority = conActPriorityY;
    }
  }

  if (priority == 3) {
    //if red
    if (rPriority == conActPriorityR) {
      rPriority = conInActPriorityR;
      yPriority = conActPriorityY;
      gPriority = conActPriorityG;
      selectedPriority = 3;
    } else {
      rPriority = conActPriorityR;
    }
  }
}

class AddingTaskScreen extends StatefulWidget {
  @override
  State<AddingTaskScreen> createState() => _AddingTaskScreenState();
}

//each section will be a widget with rounded corners
class _AddingTaskScreenState extends State<AddingTaskScreen> {
  bool alarmIsSet = false;
  DateTime? dateTime;
  TextEditingController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, //prevents the keyboarsd from overflowing
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 18),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                controller?.clear();
              },
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: conPrimaryB.withOpacity(.8),
                size: 50,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                child: SafeArea(
                  child: Stack(
                    children: [
                      SizedBox(

                          // ignore: prefer_const_constructors
                          child: Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        padding:
                            EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 15,
                                  offset: Offset(5, 5),
                                  color: Colors.grey.withOpacity(.3))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: TextFormField(
                          controller: controller,
                          onChanged: (newText) {
                            newTask = newText;
                          },
                          decoration: InputDecoration(
                              hintText: 'Add Todo',
                              hintStyle: conTodoTextStyle.copyWith(
                                  fontSize: 18,
                                  color: conPrimaryB.withOpacity(.6)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: conPrimaryY, width: 2)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                          autofocus: false,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            offset: Offset(5, 5),
                            color: Colors.grey.withOpacity(.3))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: priority()),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          offset: Offset(5, 5),
                          color: Colors.grey.withOpacity(.3))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'notification',
                        style:
                            connotifacationTimeTextStyle.copyWith(fontSize: 17),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                            dragStartBehavior: DragStartBehavior.start,
                            value: alarmIsSet,
                            onChanged: (value) {
                              setState(() {
                                alarmIsSet = value;
                              });
                            })),
                    Visibility(
                      visible: alarmIsSet,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: TimePickerSpinner(
                          is24HourMode: false,
                          normalTextStyle: connotifacationTimeTextStyle
                              .copyWith(color: conPrimaryB.withOpacity(.2)),
                          highlightedTextStyle: connotifacationTimeTextStyle,
                          spacing: 20,
                          itemHeight: 40,
                          isForce2Digits: true,
                          onTimeChange: (time) {
                            setState(() {
                              dateTime = time;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                      backgroundColor: conPrimaryY,
                      child: Icon(
                        Icons.check,
                        size: 40,
                      ),
                      onPressed: () {
                        newTask == null
                            ? Navigator.pop
                            : {
                                Provider.of<TaskData>(context, listen: false)
                                    .addTask(
                                        newTask.toString(),
                                        false,
                                        selectedPriority,
                                        alarmIsSet ? dateTime : null,
                                        false,
                                        CurrentDate),
                                Provider.of<TaskData>(context, listen: false)
                                    .resetPriority(),
                                selectedPriority =
                                    1, //to reset the priority color to green when no color is selected
                                Navigator.pop(context),
                                alarmIsSet && dateTime != null
                                    ? Alarm.set(
                                        alarmDateTime: dateTime as DateTime,
                                        assetAudio: "images/alarm.mp3",
                                        notifTitle: "remainder ",
                                        notifBody:
                                            "don't forget to ${newTask.toString()}",
                                      )
                                    : null,
                                controller?.clear()
                              };
                      }),
                ),
              )
            ],
          ),
        ));
  }
}

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
                fontSize: 17, fontFamily: 'Comics', color: conPrimaryB),
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
