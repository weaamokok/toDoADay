// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task.dart';
import 'package:to_do_a_day/elements/widgets/toDosContainer.dart';
import '../elements/const.dart';
import '../elements/module/signing.dart';
import '../elements/module/task_data.dart';
import '../elements/widgets.dart';
import '../elements/widgets/addingTodo.dart';
import '../elements/widgets/tasksList.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<Task> Tasks = [];

//TODO refactor the screen
class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

void archivingAction(context) {
  //archiving
}

class _TasksScreenState extends State<TasksScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double? screenWidth, ScreenHeigth;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Tasks = TaskData().tasks;
    Provider.of<siggning>(context, listen: false).getCurrentUser();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.8,
    ).animate(_controller!);
    // Provider.of<TaskData>(context, listen: false).timerForArchive(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    ScreenHeigth = size.height;
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //to avoid the keyboard effecting the backgroung
      backgroundColor: conPrimaryY,
      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.menu_rounded,
      //     color: Colors.white,
      //     size: 30,
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.help_rounded),
      //       color: Colors.white,
      //       iconSize: 30,
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/arc');
      //       },
      //     ),
      //     SizedBox(
      //       width: 10,
      //     ),
      //   ],
      //   elevation: 0,
      //   backgroundColor: conPrimaryY,
      // ),
      body: Stack(children: [menu(context), Dashboard(context)]),
    );
  }

  Widget menu(context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                CircleAvatar(
                  //Avatar
                  backgroundColor: Color(0xff).withOpacity(0),
                  radius: 50,
                  child: Image.asset(
                    'images/Stuck at Home - Avatar.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        //UserName
                        Provider.of<siggning>(context, listen: false)
                            .loggedUser!
                            .email
                            .toString()
                            .split('@')
                            .first,
                        style: conToday.copyWith(fontSize: 17)),
                    Text(
                      //Email
                      Provider.of<siggning>(context, listen: false)
                          .loggedUser!
                          .email
                          .toString(),
                      style: conTodaysDate.copyWith(
                          color: Colors.white.withOpacity(0.8)),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 90,
          ),
          menuNavs(LineIcons.clipboardList, 'My to-dos', () {
            Navigator.pushNamed(context, '/task');
          }, '/task', context),
          menuNavs(LineIcons.archive, 'Archive', () {
            Navigator.pushNamed(context, '/arc');
          }, '/arc', context),
          menuNavs(LineIcons.bell, 'Alarm settings', () {
            Navigator.pushNamed(context, '/alarm');
          }, '', context),
          menuNavs(LineIcons.alternateUser, 'Profile', () {
            Navigator.pushNamed(context, '/pro');
          }, '', context),
          SizedBox(
            height: 190,
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              iconText(Icons.settings, 'settings', () {}),
              Text(
                '|',
                style: conToday,
              ),
              iconText(Icons.logout_rounded, 'logout', () {
                Provider.of<siggning>(context, listen: false).auth.signOut();
              })
            ],
          )
        ],
      ),
    );
  }

  Widget Dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.83 * screenWidth!,
      right: isCollapsed ? 0 : -0.3 * screenWidth!,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: SafeArea(
          child: Container(
            color: conPrimaryY,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(Icons.menu_rounded),
                          color: Colors.white,
                          iconSize: 35,
                          onPressed: () {
                            setState(() {
                              isCollapsed
                                  ? _controller!.forward()
                                  : _controller!.reverse();
                              isCollapsed = !isCollapsed;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          width: 300,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(Icons.help_rounded),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: () {
                            Navigator.pushNamed(context, '/arc');
                            // Provider.of<TaskData>(context, listen: false)
                            //     .archivingTheDay();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20, left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Today',
                                style: conToday,
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              displayedDate,
                              //today's date
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Expanded(child: todosContainer())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
