import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:to_do_a_day/elements/module/signing.dart';
import 'package:to_do_a_day/elements/module/task.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import 'package:to_do_a_day/screens/loginScreen.dart';
import 'package:to_do_a_day/screens/signUpScreen.dart';
import 'package:to_do_a_day/screens/startScreen.dart';
import 'elements/const.dart';
import 'elements/widgets/addingTodoScreen.dart';
import 'screens/alarmScreen.dart';
import 'screens/archiveScreen.dart';
import 'screens/profile.dart';
import 'screens/task_screen.dart';
import 'elements/module/task_data.dart';
import 'elements/module/databaseHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
  Alarm.init();
  Alarm.set(
      alarmDateTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 00, 00, 00),
      assetAudio: "images/alarm.mp3",
      notifTitle: "Tasks are been archived",
      notifBody: "stay productive!",
      onRing: () {
        TaskData().ArchivingFunctionality();
      });
  Alarm.set(
    alarmDateTime: TaskData().morningAlert,
    assetAudio: "images/alarm.mp3",
    notifTitle: "Good Day",
    notifBody: "don't forget to add your todos for Today",
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TaskData(),
          ),
          ChangeNotifierProvider(create: (context) => siggning())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TasksScreen(),
          theme: ThemeData(
              timePickerTheme: timePickerTheme,
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => yellow),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.deepOrange),
                ),
              )),
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/start': (context) => startingScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/arc': (context) => ArchiveScreen(),
            '/task': ((context) => TasksScreen()),
            '/addTask': ((context) => AddingTaskScreen()),
            '/log': ((context) => loginScreen()),
            '/sign': ((context) => SignUpScreen()),
            'pro': ((context) => profile()),
            '/alarm': ((context) => alarmScreen()),
          },
        ));
  }
}
