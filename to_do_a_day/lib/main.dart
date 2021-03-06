import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/const.dart';
import 'package:to_do_a_day/elements/module/signing.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import 'package:to_do_a_day/screens/loginScreen.dart';
import 'package:to_do_a_day/screens/signUpScreen.dart';
import 'package:to_do_a_day/screens/startScreen.dart';
import 'screens/alarmScreen.dart';
import 'screens/archiveScreen.dart';
import 'screens/profile.dart';
import 'screens/task_screen.dart';
import 'elements/module/task_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
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
          initialRoute: '/task',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/': (context) => startingScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/arc': (context) => ArchiveScreen(),
            '/task': ((context) => TasksScreen()),
            '/log': ((context) => loginScreen()),
            '/sign': ((context) => SignUpScreen()),
            'pro': ((context) => profile()),
            '/alarm': ((context) => alarmScreen()),
          },
        ));
  }
}
