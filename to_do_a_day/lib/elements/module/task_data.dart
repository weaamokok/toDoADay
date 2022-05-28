import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Task> _tasks = [];
  List<List<Task>> _taskArchive = [];
  final fireStore = FirebaseFirestore.instance;

  // List<List<Task>> deserializedLists=_taskArchive.;

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(
        _tasks); //to prevent any modifiing on the list of tasks
  }

  UnmodifiableListView<List<Task>> get archivesTasks {
    return UnmodifiableListView(
        _taskArchive); //to prevent any modifiing on the list of tasks
  }

  void addTask(String name, bool isDone, int priority, DateTime? notifacation) {
    final task = Task(
        name: name,
        priority: priority,
        isDone: false,
        notifacation: notifacation);
    _tasks.add(task);
    notifyListeners();
  }

  void archivingTheDay(List<Task> tasks) {
    tasks.map((task) => fireStore.collection('tasks').add({
          'isDone': task.isDone,
          'name': task.name,
          'notifacation': task.notifacation,
          'priority': task.priority
        }));
  }

  bool isArchiveEmpty() {
    return archivesTasks.iterator.moveNext();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deletingTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  bool isEmptyList() {
    return _tasks.iterator.moveNext();
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
