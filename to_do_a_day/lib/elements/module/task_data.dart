import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:to_do_a_day/elements/widgets/taskTile.dart';
import '../../screens/task_screen.dart';
import '../const.dart';
import 'task.dart';
import 'dart:collection';
import 'package:to_do_a_day/elements/module/databaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData extends ChangeNotifier {
  final db = DatabaseHandler();
  // ignore: prefer_final_fields
  List<Task> tasks = [
    // Task(name: 'nme', priority: 1),
    // Task(name: 'ame', priority: 1)
  ];
  List<List<Task>> _taskArchive = [];
  final fireStore = FirebaseFirestore.instance;

  // List<List<Task>> deserializedLists=_taskArchive.;

  UnmodifiableListView<Task> get tasksy {
    return UnmodifiableListView(
        tasks); //to prevent any modifiing on the list of tasks
  }

  UnmodifiableListView<List<Task>> get archivesTasks {
    return UnmodifiableListView(
        _taskArchive); //to prevent any modifiing on the list of tasks
  }

  // Future<List<Task>> getTasks() async {
  //   List<Task> tasks = await db.getTasks();
  //   notifyListeners();
  //   return tasks;
  // }

  void addTask(String name, bool isDone, int priority, DateTime? notifacation,
      bool isArchives, DateTime creationTime) {
    final task = Task(
        name: name,
        priority: priority,
        isDone: false,
        notifacation: notifacation,
        isArchived: false,
        creationTime: CurrentDate);
    Tasks.add(task);
    notifyListeners();
    db.insertTask(task);
  }

  void archivingTheDay() {
    db.archivingTasks();
    // tasks.map((task) => print(task.name));
    // tasks.map((task) => {});
    notifyListeners();
  }

  void timerForArchive(context) {
    DateFormat formator = DateFormat('yyyy-MM-dd');
    String formated = formator.format(DateTime(
      CurrentDate.year,
      CurrentDate.month,
      CurrentDate.day + 1,
    ));
    // String formated = formator.format(CurrentDate);
    DateTime timetoArch = DateTime.parse("$formated 00:00:00Z");
    Timer(timetoArch.difference(CurrentDate), () {
      notifyListeners();
      db.archivingTasks();
    });
  }

  void ArchiveEmpty() {
    notifyListeners();
    db.EmptyArchive();
  }

  void updateTask(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
    db.DoneUpdate(task);
  }

  void deletingTask(Task task) {
    tasks.remove(task);
    notifyListeners();
    db.deleteTask(task);
  }

  bool isEmptyList() {
    return Tasks.iterator.moveNext();
  }

  int? countinarchiveLen() {
    int? archiveLen;
    archivesTasks
        .map((taskList) => taskList)
        .map((tasks) => tasks)
        .map((element) => {
              () {
                archiveLen! + 1;
              }
            });

    return archiveLen;
  }
}

void selectedPage() {}
