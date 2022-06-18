// ignore_for_file: prefer_const_constructors
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import 'package:flutter/material.dart';
import 'package:to_do_a_day/elements/widgets.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
// ignore: unnecessary_import

import '../const.dart';

String newTask = '';
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

void resetPriority() {
  gPriority = conActPriorityG;
  rPriority = conActPriorityR;
  yPriority = conActPriorityY;
}

class AddingTaskScreen extends StatefulWidget {
  @override
  State<AddingTaskScreen> createState() => _AddingTaskScreenState();
}

//each section will be a widget with rounded corners
class _AddingTaskScreenState extends State<AddingTaskScreen> {
  bool alarmIsSet = false;
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: SafeArea(
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(50, 0),
                      // ignore: prefer_const_constructors
                      child: SizedBox(
                          width: 300,
                          // ignore: prefer_const_constructors
                          child: TextFormField(
                            onChanged: (newText) {
                              newTask = newText;
                            },
                            decoration: InputDecoration(
                                hintText: 'Add To Do',
                                hintStyle: conTodoTextStyle.copyWith(
                                    fontSize: 18,
                                    color: conPrimaryB.withOpacity(.3)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            autofocus: false,
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    )),
                child: priority()),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 31),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  )),
              child: Stack(
                children: [
                  Text(
                    'notification',
                    style: connotifacationTimeTextStyle.copyWith(fontSize: 16),
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
                        normalTextStyle: connotifacationTimeTextStyle.copyWith(
                            color: conPrimaryB.withOpacity(.2)),
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
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          newTask == ''
                              ? Navigator.pop
                              : Provider.of<TaskData>(context, listen: false)
                                  .addTask(
                                      newTask,
                                      false,
                                      selectedPriority,
                                      alarmIsSet ? dateTime : null,
                                      false,
                                      CurrentDate);

                          resetPriority();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'cancel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Comics',
                              color: conPrimaryB.withOpacity(.7)),
                        )),
                    InkWell(
                        onTap: () {
                          newTask == ''
                              ? Navigator.pop
                              : Provider.of<TaskData>(context, listen: false)
                                  .addTask(
                                      newTask,
                                      false,
                                      selectedPriority,
                                      alarmIsSet ? dateTime : null,
                                      false,
                                      CurrentDate);

                          resetPriority();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Comics',
                              color: yellow),
                        )),
                  ],
                ),
              ),
            )
          ],
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
