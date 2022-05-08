import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/module/task_data.dart';
import 'screens/archiveScreen.dart';
import 'screens/task_screen.dart';
import 'elements/module/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => TasksScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/arc': (context) => ArchiveScreen(),
        },
      ),
    );
  }
}
