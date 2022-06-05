import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sql.dart';
import 'package:to_do_a_day/elements/module/database.dart';
import 'package:to_do_a_day/elements/widgets/taskTile.dart';
import '../../screens/task_screen.dart';
import '../const.dart';
import 'task.dart';
import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData extends ChangeNotifier {
  static final TodoProvider _todoProvider = TodoProvider();
  Future<void> insert(Task task) async {
    final db = await _todoProvider.database;
    // await db.rawInsert(
    //     "INSERT INTO Task(name,isDone ,priority,notifiction,isArchived,creationDate) VALUES (?,0,?,?,0,datetime('now','localtime')) ",
    //     ['${task.name}', task.priority, ' ${task.notifacation}']);
    await db.insert('Task', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  // Future<List<Task>> getTodo() async {
  //   final db = await _todoProvider.database;

  //   //query the table of task, will get all tasks
  //   List<Map<String, dynamic>> maps =
  //       await db.query('Task', orderBy: 'id DESC');
  //   //convert list<map<String,dynamic>> into a list<Task>
  //   notifyListeners();

  //   return List.generate(maps.length, (index) => Task.fromMap(maps[index]));
  // }

  // final TodoProvider _providTasks = TodoProvider();
  // Future<List<Task>> getListTask() async {
  //   final tasks = await getTodo();
  //   Tasks.addAll(tasks);
  //   notifyListeners();
  //   return tasks;
  // }

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

  // Future<List<Task>> getTasks() {
  //   notifyListeners();
  //   return getTodo();
  // }

  // Future<int> TasksCount() async {
  //   List f = getTodo() as List;
  //   return f.length;
  // }

  // void addTask(String name, bool isDone, int priority, DateTime? notifacation) {
  //   final task = Task(
  //       name: name,
  //       priority: priority,
  //       isDone: false,
  //       notifacation: notifacation);
  //   Tasks.add(task);
  //   notifyListeners();
  // }

  void archivingTheDay(List<Task> tasks) {
    for (var task in tasks) {
      print(task.name);
      fireStore.collection('tasks').add({
        'isDone': task.isDone,
        'name': task.name,
        'notifacation': task.notifacation,
        'priority': task.priority
      });
      Tasks.clear();
    }
    // tasks.map((task) => print(task.name));
    // tasks.map((task) => {});
    notifyListeners();
  }

  void timerForArchive(context) {
    DateFormat formator = DateFormat('yyyy-MM-dd');
    String formated = formator.format(CurrentDate);
    DateTime timetoArch = DateTime.parse("$formated 09:35:00Z");
    Timer(timetoArch.difference(CurrentDate), () {
      archivingTheDay(Tasks);

      notifyListeners();
    });
  }

  bool isArchiveEmpty() {
    return archivesTasks.iterator.moveNext();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deletingTask(Task task) {
    tasks.remove(task);
    notifyListeners();
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
//-------------------database
